import 'package:rive_animations/src/screen/home/home-screen.dart';
import 'package:rive_animations/src/screen/login/login-screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (_) => LoginScreen(),
    'home': (_) => HomeScreen(),
  };
}
