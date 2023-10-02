import 'package:flutter/material.dart';

class LoginController {
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  String? email;
  setEmail(String? value) => email = value;

  String? password;
  setPassword(String? value) => password = value;

  Future<bool> auth() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
    return email == 'admin@example.com' && password == '123456';
  }
}
