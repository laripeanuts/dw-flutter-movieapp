import 'package:flutter/material.dart';
import 'package:movieapp/services/prefs_service.dart';

class LoginController {
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  String? _email;
  setEmail(String? value) => _email = value;

  String? _password;
  setPassword(String? value) => _password = value;

  Future<bool> auth() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;

    final isValidUser = _email == 'admin@example.com' && _password == '123456';

    if (isValidUser) {
      PrefsService.save(_email!);
    }

    return isValidUser;
  }
}
