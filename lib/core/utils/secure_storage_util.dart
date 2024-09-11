import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageUtil {
  static late FlutterSecureStorage _flutterSecureStorage;
  static const String keyAccessToken = "keyAccessToken";
  static const String keyDeviceId = "keyDeviceId";

  SecureStorageUtil();

  factory SecureStorageUtil.getInstance(FlutterSecureStorage flutterSecureStorage) {
    _flutterSecureStorage = flutterSecureStorage;
    return SecureStorageUtil();
  }

  // String
  Future<void> writeString(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String?> readString(String key) async {
    return await _flutterSecureStorage.read(key: key);
  }

  // Bool
  Future<void> writeBool(String key, bool value) async {
    await _flutterSecureStorage.write(key: key, value: value.toString());
  }

  Future<bool?> readBool(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value != null ? value == 'true' : null;
  }

  // Int
  Future<void> writeInt(String key, int value) async {
    await _flutterSecureStorage.write(key: key, value: value.toString());
  }

  Future<int?> readInt(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value != null ? int.parse(value) : null;
  }

  // Double
  Future<void> writeDouble(String key, double value) async {
    await _flutterSecureStorage.write(key: key, value: value.toString());
  }

  Future<double?> readDouble(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value != null ? double.parse(value) : null;
  }

  Future<bool> isKeyExist(String key) async {
    return await _flutterSecureStorage.containsKey(key: key);
  }

  // List String
  Future<void> writeListString(String key, List<String> value) async {
    await _flutterSecureStorage.write(key: key, value: value.join(','));
  }

  Future<List<String>?> readListString(String key) async {
    String? value = await _flutterSecureStorage.read(key: key);
    return value?.split(',');
  }

  // Delete
  Future<void> delete(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _flutterSecureStorage.deleteAll();
  }

  // TODO: guest token
  Future<String> getAccessToken() async {
    return await readString(keyAccessToken) ?? "";
  }
}
