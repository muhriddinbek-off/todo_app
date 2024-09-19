import '../../utils/export_link.dart';

class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String category;
  final DateTime dedline;
  final int priority;
  final TaskStatus status;

  TaskModel({
    this.id,
    required this.category,
    required this.dedline,
    required this.description,
    required this.priority,
    required this.status,
    required this.title,
  });

  TaskModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    DateTime? dedline,
    int? priority,
    TaskStatus? status,
  }) {
    return TaskModel(
      category: category ?? this.category,
      dedline: dedline ?? this.dedline,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      title: title ?? this.title,
    );
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      category: json[TaskModalConstants.category] as String? ?? '',
      dedline: DateTime.parse(json[TaskModalConstants.dedline] as String? ?? ''),
      description: json[TaskModalConstants.description] as String? ?? '',
      priority: json[TaskModalConstants.priority] as int? ?? 1,
      status: getStatus(json[TaskModalConstants.status] as String? ?? ''),
      title: json[TaskModalConstants.title] as String? ?? '',
      id: json[TaskModalConstants.id] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      TaskModalConstants.category: category,
      TaskModalConstants.dedline: dedline.toString(),
      TaskModalConstants.description: description,
      TaskModalConstants.priority: priority,
      TaskModalConstants.status: status.name,
      TaskModalConstants.title: title,
    };
  }

  bool canAddTaskToDatabase() {
    if (category.isEmpty) return false;
    if (title.isEmpty) return false;
    if (description.isEmpty) return false;
    if (priority == 0) return false;
    return true;
  }

  static TaskModel initialValue = TaskModel(
    category: '',
    dedline: DateTime.now(),
    description: '',
    priority: 0,
    status: TaskStatus.processing,
    title: '',
  );
}

TaskStatus getStatus(String statusText) {
  switch (statusText) {
    case 'processing':
      {
        return TaskStatus.processing;
      }
    case 'done':
      {
        return TaskStatus.processing;
      }
    case 'canceled':
      {
        return TaskStatus.processing;
      }
    default:
      {
        return TaskStatus.missed;
      }
  }
}
