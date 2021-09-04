import 'package:flare_animations/src/core/helpers/debouncer.dart';
import 'package:flutter/material.dart';

class LoginFOrmProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  // Debouncer
  final _debouncer = Debouncer(milliseconds: 1000);

  // Animation rive controllers
  bool? coveredEyes;

// getters and setters
  String get email => _email;
  set email(String value) {
    this._email = value;
    print(value);
  }

  String get password => _password;

// using the debouncer with setter
  set password(String value) {
    if (_password.length < value.length) {
      coveredEyes = true;
    }

    _password = value;

    _debouncer.run(() {
      print(_password);
      coveredEyes = false;
      notifyListeners();
    });

    notifyListeners();
  }

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
