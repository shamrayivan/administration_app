import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageRepository {
  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<String?> getData({required String key}) async => _storage.read(key: key);

  Future<void> setData({required String key, required String? value}) async => await _storage.write(key: key, value: value);

  Future<void> remove({required String key}) async => _storage.delete(key: key);

  Future<void> allCleanData() async => _storage.deleteAll();
}
