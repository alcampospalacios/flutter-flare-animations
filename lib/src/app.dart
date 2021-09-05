import 'package:rive_animations/src/routes/routes.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Animaciones Pro',
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.indigo,
            appBarTheme: AppBarTheme(color: Colors.indigo),
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: Colors.indigo)),
        initialRoute: 'login',
        routes: getApplicationRoutes());
  }
}
