import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService{
  final String _baseUrl = 'https://api.example.com';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      body: {'email': email, 'password': password},
    );
    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async{ //future je vedno produkt asinhrone funkcije
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      body: {'name': name, 'email': email, 'password': password},
    );
    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to register');
    }
  }
}