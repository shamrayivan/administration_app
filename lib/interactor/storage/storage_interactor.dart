import 'package:administration_app/interactor/storage/repository/storage_repository.dart';

class StorageInteractor {
  final _repository = StorageRepository();

  Future<String?> getData({required String key}) => _repository.getData(key: key);

  Future<void> setData({required String key, required String? value}) =>
      _repository.setData(key: key, value: value);

  Future<void> remove({required String key}) => _repository.remove(key: key);

  Future<void> allCleanData() => _repository.allCleanData();
}
