import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/navigation/navigation_state.dart';
import 'package:todo_app/data/local/local_database.dart';
import 'package:todo_app/data/models/task_model.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState());

  void getSelectItemOnboarding(int value) {
    emit(NavigationState(onboardingIndex: value));
  }

  void getSelectItemDialog(int value) {
    emit(NavigationState(dialogIndex: value));
  }

  void getInsertTasks(TaskModel task) async {
    LocalDatabase.insertTask(task);
  }

  void getAllTasksData() async {
    emit(NavigationState(tasks: await LocalDatabase.getAllTasks()));
  }

  void getDeleteTasksData(int i) async {
    LocalDatabase.deleteTask(i);
    emit(NavigationState(tasks: await LocalDatabase.getAllTasks()));
  }
}
