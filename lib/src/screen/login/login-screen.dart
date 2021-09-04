import 'dart:ui';

import 'package:flare_animations/src/core/providers/login-form-provider.dart';
import 'package:flare_animations/src/core/widgets/acp-widgets.dart';
import 'package:flare_animations/src/screen/login/login-screen.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (_) => LoginFOrmProvider(),
      child: LoginBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CardContainerWidget(
                  child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  LoginForm(),
                ],
              )),
              SizedBox(
                height: 35,
              ),
              // TextButton(
              //     child: Text(
              //       'Crear una nueva cuenta',
              //       style: TextStyle(color: Colors.black54),
              //     ),
              //     style: ButtonStyle(
              //         overlayColor: MaterialStateProperty.all(
              //             Colors.indigo.withOpacity(0.1)),
              //         shape: MaterialStateProperty.all(StadiumBorder())),
              //     onPressed: () {}),

              Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 36,
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: Divider(
                        color: Colors.black12,
                        height: 36,
                      )),
                ),
              ]),

              SizedBox(
                height: 15,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    IconButton(
                      alignment: Alignment.center,
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.google,
                          size: 40,
                          color: Colors.red[700],
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          size: 40,
                          color: Colors.black87,
                        ),
                        onPressed: () {}),
                    SizedBox(
                      width: 50,
                    ),
                    IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.twitter,
                          size: 40,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
