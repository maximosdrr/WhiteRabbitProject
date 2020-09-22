import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_rabbit_app/app/helpers/pickers/icon_picker.dart';
import 'registration_controller.dart';

class RegistrationPage extends StatefulWidget {
  final String title;
  const RegistrationPage({Key key, this.title = "Registration"})
      : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState
    extends ModularState<RegistrationPage, RegistrationController> {
  //use 'controller' variable to access controller
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _myActivity = 'rabbit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(91, 134, 229, 1),
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            IconPicker.getSvgPath(
                              _myActivity,
                            ),
                            width: 100,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text('Esse sera seu ícone'),
                          )
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 15,
                      ),
                      elevation: 14,
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _nameController,
                              decoration: InputDecoration(
                                hintText: 'Nome',
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
                            TextFormField(
                                controller: _usernameController,
                                decoration: InputDecoration(
                                  hintText: 'Usuario',
                                ),
                                validator: (String text) {
                                  if (text.isEmpty) {
                                    return 'O campo não pode estar vazio';
                                  }
                                  if (text.length < 3) {
                                    return 'O campo deve conter no minimo 3 caracteres';
                                  }

                                  return null;
                                }),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                hintText: 'Senha',
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
                              },
                            ),
                            TextFormField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                hintText: 'Confirme sua senha',
                              ),
                              obscureText: true,
                              validator: (String text) {
                                if (text != _passwordController.text) {
                                  return 'As senhas não conferem';
                                }
                                return null;
                              },
                            ),
                            DropDownFormField(
                              titleText: 'Selecione o icone',
                              hintText: 'Please choose one',
                              value: _myActivity,
                              onChanged: (value) {
                                setState(() {
                                  _myActivity = value;
                                });
                              },
                              dataSource: [
                                {
                                  "display": "Coelho 1",
                                  "value": "rabbit",
                                },
                                {
                                  "display": "Coelho 2",
                                  "value": "rabbit1",
                                },
                                {
                                  "display": "Coelho 3",
                                  "value": "rabbit2",
                                },
                                {
                                  "display": "Coelho 4",
                                  "value": "logo",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 10,
                        top: 20,
                      ),
                      alignment: Alignment.bottomRight,
                      child: RaisedButton(
                        child: Text(
                          'Registrar',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.blue[800],
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await controller.registration(
                              _nameController.text,
                              _usernameController.text,
                              _passwordController.text,
                              _myActivity,
                            );
                          }
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
                                fontSize: 18,
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
