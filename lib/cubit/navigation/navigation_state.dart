import 'package:todo_app/data/models/task_model.dart';

class NavigationState {
  int onboardingIndex;
  int dialogIndex;
  List<TaskModel> tasks;
  NavigationState({
    this.dialogIndex = 0,
    this.onboardingIndex = 0,
    this.tasks = const <TaskModel>[],
  });
}
