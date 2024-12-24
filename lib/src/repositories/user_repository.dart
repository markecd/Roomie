import '../models/user.dart';
import '../services/auth_service.dart';

class UserRepository {
  final AuthService _authService = AuthService();

  Future<User> login(String email, String password) async {
    final data = await _authService.login(email, password);
    return User.fromJson(data);
  }

  Future<User> register(String name, String email, String password) async {
    final data = await _authService.register(name, email, password);
    return User.fromJson(data);
  }
}