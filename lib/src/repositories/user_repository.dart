import '../models/user.dart';
import '../services/auth_service.dart';

class UserRepository {
  final AuthService _authService = AuthService();

  Future<User> login(String email, String password) async {
    final firebaseUser = await _authService.signInWithEmailPassword(email, password);
    if (firebaseUser == null) {
      throw Exception("Failed to login.");
    }
    return User(id: firebaseUser.uid, name: "", surname: "", email: firebaseUser.email ?? "");
  }

  Future<User> register(String name, String surname, String email, String password) async {
    final firebaseUser = await _authService.signUpWithEmailPassowrd(name, surname, email, password);
    if (firebaseUser == null) {
      throw Exception("Failed to register.");
    }
    return User(id: firebaseUser.uid, name: "", surname: "", email: firebaseUser.email ?? "");
  }
}