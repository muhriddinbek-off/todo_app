import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/initial_value/initial_value_state.dart';
import 'package:todo_app/data/local/shared_preferenses_storage.dart';
import 'package:todo_app/utils/app_constanta.dart';

class InitialValueCubit extends Cubit<InitialValueState> {
  InitialValueCubit() : super(InitialValueState());

  void getCreateFullName({
    required String first,
    required String last,
  }) {
    StorageRepository.setString(key: AppConstanta.fullName, value: "$first $last");
    emit(InitialValueState(fullName: StorageRepository.getString(key: AppConstanta.fullName)));
  }

  void getChangeValue({
    required bool isChange,
  }) {
    StorageRepository.setBool(key: AppConstanta.storageValue, value: isChange);
    emit(InitialValueState(isChange: StorageRepository.getBool(key: AppConstanta.storageValue)));
  }
}
