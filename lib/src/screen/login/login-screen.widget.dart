import 'package:flare_animations/src/core/providers/login-form-provider.dart';
import 'package:flare_animations/src/core/utils/acp-decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:flutter/src/painting/gradient.dart' as gradients;

class LoginBackgroundWidget extends StatelessWidget {
  final Widget child;
  const LoginBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [_RiveAnimationContainer(), this.child],
      ),
    );
  }
}

class _RiveAnimationContainer extends StatefulWidget {
  const _RiveAnimationContainer({Key? key}) : super(key: key);

  @override
  _RiveAnimationContainerState createState() => _RiveAnimationContainerState();
}

class _RiveAnimationContainerState extends State<_RiveAnimationContainer> {
  // Declarations necessary to rive
  final riveFileName = 'assets/copy_bear.riv';
  Artboard? _artboard;
  bool? coveredEyes;

// Animation controller
  late RiveAnimationController _animationController;

  @override
  void initState() {
    // Init rive animation when the widget is ready
    _loadRiveFile();
    super.initState();
  }

  // Loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    RiveFile rFile = RiveFile.import(bytes);

    setState(() => _artboard = rFile.mainArtboard
      ..addController(
        _animationController = SimpleAnimation('idle'),
      ));
  }

// Changing the animation on controller
  void onChange() {
    if (coveredEyes!) {
      _artboard!
          .addController(_animationController = SimpleAnimation('hands_up'));
    } else {
      _artboard!
          .addController(_animationController = SimpleAnimation('hands_down'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final loginForm = Provider.of<LoginFOrmProvider>(context);

    if (loginForm.coveredEyes != null) {
      if (this.coveredEyes != loginForm.coveredEyes) {
        this.coveredEyes = loginForm.coveredEyes!;
        onChange();
      }
    }

    return Container(
        width: double.infinity,
        height: size.height * 0.4,
        decoration: BoxDecoration(
            gradient: gradients.LinearGradient(colors: [
          Color.fromRGBO(63, 63, 156, 1),
          Color.fromRGBO(90, 70, 178, 1)
        ])),
        child: _artboard != null
            ? Rive(
                artboard: _artboard!,
              )
            : Container());
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFOrmProvider>(context);

    return Container(
        child: Form(
            key: loginForm.formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: ACPDecorations.acpInputDecorationMethod(
                        hintText: 'john.doe@gmail.com',
                        labelText: 'Correo electronico',
                        prefixIcon: Icons.alternate_email_sharp),
                    onChanged: (value) => loginForm.email = value,
                    validator: (value) {
                      String pattern =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = new RegExp(pattern);

                      return regExp.hasMatch(value ?? '')
                          ? null
                          : 'El correo no es válido';
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 45),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: ACPDecorations.acpInputDecorationMethod(
                        hintText: '******',
                        labelText: 'Contraseña ',
                        prefixIcon: Icons.lock_outline),
                    onChanged: (value) => loginForm.password = value,
                    validator: (value) {
                      return (value != null && value.length >= 5)
                          ? null
                          : 'La conseña debe tener al menos 5 carácteres';
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.grey,
                    elevation: 0,
                    color: Colors.indigo,
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                        child: Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.white),
                        )),
                    onPressed: () {})
              ],
            )));
  }
}
