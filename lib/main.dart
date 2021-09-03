import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38, 50, 56, 1),
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String animationType = '';
  bool day_night = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: GestureDetector(
        child: FlareActor(
          'assets/switch_daytime.flr',
          alignment: Alignment.centerRight,
          fit: BoxFit.contain,
          animation: animationType,
          callback: (animation) {
            setState(() {
              if (animationType == 'switch_day') animationType = 'day_idle';

              if (animationType == 'switch_night') animationType = 'night_idle';
            });
          },
        ),
        onTap: () {
          setState(() {
            if (!day_night) {
              print('switch_night');
              animationType = 'switch_night';
            } else {
              print('switch_day');
              animationType = 'switch_day';
            }
          });
          day_night = !day_night;
        },
      ),
    );
  }
}
