import 'package:flare_animations/src/core/providers/login-form-provider.dart';
import 'package:flare_animations/src/core/widgets/acp-widgets.dart';
import 'package:flare_animations/src/screen/login/login-screen.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginBackgroundWidget(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CardContainerWidget(
                child: Column(
              children: [
                Text(
                  'Iniciar sesión',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 10,
                ),
                ChangeNotifierProvider(
                  create: (_) => LoginFOrmProvider(),
                  child: LoginForm(),
                )
              ],
            )),
            SizedBox(
              height: 35,
            ),
            TextButton(
                child: Text(
                  'Crear una nueva cuenta',
                  style: TextStyle(color: Colors.black54),
                ),
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                        Colors.indigo.withOpacity(0.1)),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                onPressed: () {}),
          ],
        ),
      ),
    ));
  }
}
