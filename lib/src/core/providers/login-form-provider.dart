import 'package:rive_animations/src/core/helpers/debouncer.dart';
import 'package:flutter/material.dart';

class LoginFOrmProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  bool _isLoading = false;

  // Debouncer
  final _debouncer = Debouncer(milliseconds: 1000);

  // Animation rive controllers
  bool _success = false;
  bool _fail = false;
  bool? coveredEyes;

  // stateMachine
  bool stateMachineStatus = false;

// getters and setters
  String get email => _email;
  set email(String value) {
    _success = false;
    _fail = false;
    this._email = value;
    this.stateMachineStatus = true;
    notifyListeners();

    _debouncer.run(() {
      this.stateMachineStatus = false;
      notifyListeners();
    });
  }

  String get password => _password;

// using the debouncer with setter
  set password(String value) {
    _success = false;
    _fail = false;
    if (_password.length < value.length) {
      coveredEyes = true;
    }

    _password = value;

    _debouncer.run(() {
      coveredEyes = false;
      notifyListeners();
    });

    notifyListeners();
  }

  bool get success => _success;
  set success(bool value) {
    _success = value;
    _fail = false;
    notifyListeners();
  }

  bool get fail => _fail;
  set fail(bool value) {
    _success = false;
    _fail = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
