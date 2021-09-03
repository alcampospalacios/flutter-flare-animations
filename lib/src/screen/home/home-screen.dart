import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(38, 50, 56, 1),
      body: FlareWidget(),
    );
  }
}

class FlareWidget extends StatefulWidget {
  @override
  _FlareWidgetState createState() => _FlareWidgetState();
}

class _FlareWidgetState extends State<FlareWidget> {
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
