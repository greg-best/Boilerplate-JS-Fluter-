import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LoginLocalDataSource {
  Future<String> getString(String key);
  Future<void> setString(String key, String value);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  Future<String> getString(String key) async {
    return await storage.read(key: key) ?? "";
  }

  @override
  Future<void> setString(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
