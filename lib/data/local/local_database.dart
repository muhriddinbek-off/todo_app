import 'package:sqflite/sqflite.dart';
import 'package:todo_app/data/models/task_constants.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:todo_app/data/models/task_model.dart';

class LocalDatabase {
  static final databaseInstance = LocalDatabase._();
  LocalDatabase._();

  factory LocalDatabase() {
    return databaseInstance;
  }

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _init("todo.db");
      return _database!;
    }
  }

  Future<Database> _init(String databaseName) async {
    String internalPath = await getDatabasesPath();
    String path = join(internalPath, databaseName);
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    await db.execute('''CREATE TABLE ${TaskModalConstants.tableName} (
      ${TaskModalConstants.id} $idType,
      ${TaskModalConstants.title} $textType,
      ${TaskModalConstants.description} $textType,
      ${TaskModalConstants.category} $textType,
      ${TaskModalConstants.dedline} $textType,
      ${TaskModalConstants.priority} $intType,
      ${TaskModalConstants.status} $textType
    )''');
  }

  static Future<TaskModel> insertTask(TaskModel taskModel) async {
    final db = await databaseInstance.database;
    int savedTaskID = await db.insert(TaskModalConstants.tableName, taskModel.toJson());
    return taskModel.copyWith(id: savedTaskID);
  }

  static Future<List<TaskModel>> getAllTasks() async {
    final db = await databaseInstance.database;
    String orderBy = "${TaskModalConstants.id} ASC";
    List json = await db.query(TaskModalConstants.tableName, orderBy: orderBy);
    return json.map((e) => TaskModel.fromJson(e)).toList();
  }

  static Future<int> deleteTask(int id) async {
    final db = await databaseInstance.database;
    int deletedID = await db.delete(
      TaskModalConstants.tableName,
      where: "${TaskModalConstants.id} = ?",
      whereArgs: [id],
    );
    return deletedID;
  }

  static Future<int> updateTask(TaskModel taskModel, int id) async {
    final db = await databaseInstance.database;
    int updateTask = await db.update(
      TaskModalConstants.tableName,
      taskModel.toJson(),
      where: "${TaskModalConstants.id} = ?",
      whereArgs: [id],
    );
    return updateTask;
  }

  static Future<int> updateTitleTask(String taskTitle, int id) async {
    final db = await databaseInstance.database;
    int updateTask = await db.update(
      TaskModalConstants.tableName,
      {TaskModalConstants.title: taskTitle},
      where: "${TaskModalConstants.id} = ?",
      whereArgs: [id],
    );
    return updateTask;
  }

  static Future<List<TaskModel>> searchTask(String quary) async {
    final db = await databaseInstance.database;
    var json = await db.query(
      TaskModalConstants.tableName,
      where: "${TaskModalConstants.title} LIKE ?",
      whereArgs: ["$quary%"],
    );
    return json.map((e) => TaskModel.fromJson(e)).toList();
  }
}
