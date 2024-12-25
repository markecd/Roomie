import 'package:flutter/material.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository _userRepository = UserRepository();
  User? _user;
  String? _error;

  User? get user => _user; //? naredi _user spremenljivko nullable
  String? get error => _error;

  Future<void> login(String email, String password) async {
    try{
      _user = await _userRepository.login(email, password);
      _error = null;
    } catch(e) {
      _error = e.toString();
    }
    notifyListeners();
  }

  Future<void> register(String name, String surname, String email, String password) async {
    try{
      _user = await _userRepository.register(name, surname, email, password);
      _error = null;
    } catch(e) {
      _error = e.toString();
    }
    notifyListeners();
  }
}