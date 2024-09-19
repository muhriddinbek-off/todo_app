import '../../utils/export_link.dart';

class InitialValueCubit extends Cubit<InitialValueState> {
  InitialValueCubit() : super(InitialValueState());

  void getCreateFullName({
    required String first,
    required String last,
  }) {
    StorageRepository.setString(key: AppConstanta.firstName, value: first);
    StorageRepository.setString(key: AppConstanta.lastName, value: last);
    emit(
      InitialValueState(
        firstName: StorageRepository.getString(key: AppConstanta.firstName),
        lastName: StorageRepository.getString(key: AppConstanta.lastName),
      ),
    );
  }

  void getChangeValue({
    required bool isChange,
  }) {
    StorageRepository.setBool(key: AppConstanta.storageValue, value: isChange);
    emit(InitialValueState(isChange: StorageRepository.getBool(key: AppConstanta.storageValue)));
  }

  Future<void> getImage(File? image, ImagePicker picker) async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    StorageRepository.setString(key: AppConstanta.accountImage, value: pickedFile!.path);
    emit(InitialValueState(accountImage: StorageRepository.getString(key: AppConstanta.accountImage)));
  }
}
