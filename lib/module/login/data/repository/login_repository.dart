import '../datasource/login_local_datasource.dart';

class LoginRepository {
  final LoginLocalDataSource localDataSource;

  LoginRepository({required this.localDataSource});

  Future<bool> login(String username, String password) async {
    final savedUsername = await localDataSource.getString("username");
    final savedPassword = await localDataSource.getString("password");

    if (savedUsername == username && savedPassword == password) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> saveLogin(String username, String password) async {
    await localDataSource.setString("username", username);
    await localDataSource.setString("password", password);
  }

  Future<String> checkUsername() async {
    return await localDataSource.getString("username");
  }

  Future<String> checkPassword() async {
    return await localDataSource.getString("password");
  }
}
