import 'dart:convert';
// ignore: unused_import
import '../config.dart';
import 'package:fitness_tracker_app/Provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  final UserProvider userProvider;
  AuthProvider(this.userProvider);
  static Future<String?> loginUser(
      String email, String password, String login) async {
    try {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User logged in successfully') {
          print('Login successful');
          return jsonResponse['token'];
        } else {
          print('Authentication failed: ${jsonResponse['message']}');
          return null;
        }
      } else {
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }
}
