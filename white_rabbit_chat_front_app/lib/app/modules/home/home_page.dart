import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_rabbit_chat/app/modules/home/widget/message.dart';
import 'package:white_rabbit_chat/app/shared/models/messageModel.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    var MediaQueryHelper = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQueryHelper.size.height * 0.9,
                child: ListView(
                  reverse: true,
                  children: [
                    MessageBox(
                      message: MessageModel.lorenIpsumMessage(),
                    ),
                    MessageBox(
                      message: MessageModel.lorenIpsumMessageForYourself(),
                    ),
                    MessageBox(
                      message: MessageModel.lorenIpsumMessage(),
                    ),
                    MessageBox(
                      message: MessageModel.lorenIpsumMessageForYourself(),
                    ),
                    MessageBox(
                      message: MessageModel.lorenIpsumMessage(),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Container(
                      width: MediaQueryHelper.size.width * 0.80,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Digite sua mensagem',
                        ),
                      ),
                    ),
                    FlatButton(
                      minWidth: 50,
                      child: Icon(Icons.send),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
