import 'package:administration_app/interactor/storage/storage_interactor.dart';
import 'package:administration_app/interactor/storage/storage_key.dart';

class StorageManager {
  final _interactor = StorageInteractor();

  Future<void> saveString({required String key, required String? text}) async {
    await _interactor.setData(key: key, value: text);
  }

  Future<String?> getString({required String key}) async {
    final String? raw = await _interactor.getData(key: key);
    return raw;
  }

  Future<void> deleteToken() async {
    await _interactor.setData(key: StorageKey.auth, value: '');
  }

  Future<void> allCleanData() async {
    await _interactor.allCleanData();
  }
}
