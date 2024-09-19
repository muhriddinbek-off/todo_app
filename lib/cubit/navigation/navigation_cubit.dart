import '../../utils/export_link.dart';

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
