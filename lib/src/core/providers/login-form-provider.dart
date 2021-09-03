import 'package:flutter/material.dart';

class LoginFOrmProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isLoading = false;

// getters and setters
  String get email => _email;
  set email(String value) {
    this._email = value;
    print(value);
  }

  String get password => _password;
  set password(String value) {
    this._password = value;
    print(value);
  }

  // Animation rive
  String animationType = 'idle';

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formKey.currentState?.validate());

    return formKey.currentState?.validate() ?? false;
  }
}
