import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:white_rabbit_app/app/helpers/pickers/gradient_picker.dart';
import 'package:white_rabbit_app/app/helpers/pickers/icon_picker.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.isAuthenticated(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == true) {
            Future.delayed(Duration.zero, () {
              Navigator.pushReplacementNamed(context, 'home');
            });
          }
          return SizedBox.expand(
            child: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  gradient: GradientPicker.getGradient(),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.only(top: 10),
                        child: SvgPicture.asset(
                          IconPicker.getSvgPath('logo'),
                          // color: Colors.green,
                          semanticsLabel: 'Hi, i\'m a white rabbit',
                          width: 120,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                        child: Card(
                          elevation: 14,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 30, left: 20, right: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Entrar',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    child: TextFormField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        labelText: 'Usuario',
                                      ),
                                      validator: (String text) {
                                        if (text.isEmpty) {
                                          return 'O campo não pode estar vazio';
                                        }

                                        if (text.length < 3) {
                                          return 'O campo deve conter no minimo 3 caracteres';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                          labelText: 'Senha',
                                        ),
                                        obscureText: true,
                                        validator: (String text) {
                                          if (text.isEmpty) {
                                            return 'O campo não pode estar vazio';
                                          }

                                          if (text.length < 3) {
                                            return 'O campo deve conter no minimo 3 caracteres';
                                          }
                                          return null;
                                        }),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                  ),
                                  Text(
                                    'Lembrar de mim',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: FlatButton(
                                minWidth: 150,
                                child: Text(
                                  "Entrar",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                color: Colors.blue[800],
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    await controller.login(
                                        _usernameController.text,
                                        _passwordController.text);
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        child: InkWell(
                          child: Text(
                            'Ainda não possui conta? clique aqui',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, '/registration');
                          },
                        ),
                      ),
                      !controller.error
                          ? Container()
                          : Container(
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              child: Text(
                                controller.errorMessage,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
