import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tennis_court_app/features/shared/services/key_value_storage_service.dart';

/// Class that follows the adaptor patron, contains do the CRUD of the local
/// storage
class SecureStorageKeyValueStorageServiceImpl extends KeyValueStorageService {
  // Create storage
  FlutterSecureStorage getLocalStorage() {
    return const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true));
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final storage = getLocalStorage();
    return await storage.read(key: key) as T?;
  }

  @override
  Future<bool> removeKey(String key) async {
    final storage = getLocalStorage();
    try {
      await storage.delete(key: key);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final storage = getLocalStorage();
    await storage.write(key: key, value: value.toString());
  }
}
