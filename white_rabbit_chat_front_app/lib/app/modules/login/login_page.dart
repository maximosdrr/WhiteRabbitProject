import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_rabbit_chat/app/shared/constants/gradients.dart';
import 'package:white_rabbit_chat/app/shared/constants/icons.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: GradientPicker.getGreenGradient(),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: SvgPicture.asset(
                      IconPicker.getSvgPath('rabbit'),
                      // color: Colors.green,
                      semanticsLabel: 'Hi, i\'m a white rabbit',
                      width: 150,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 5, right: 5),
                    child: Card(
                      elevation: 14,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, bottom: 30, left: 20, right: 20),
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
                              child: TextField(
                                decoration:
                                    InputDecoration(labelText: 'Usuario'),
                              ),
                            ),
                            Container(
                              child: TextField(
                                decoration: InputDecoration(labelText: 'Senha'),
                                obscureText: true,
                              ),
                            )
                          ],
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
                                  color: Colors.black,
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
                            color: Colors.green,
                            onPressed: () =>
                                Modular.to.navigator.pushNamed('/home'),
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
                          color: Colors.grey[600],
                        ),
                      ),
                      onTap: () => {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
