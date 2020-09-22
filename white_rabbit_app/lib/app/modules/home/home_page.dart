import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_rabbit_app/app/modules/home/widgets/drawer.dart';
import 'package:white_rabbit_app/app/modules/home/widgets/message.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final _messageController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double sendMessageAreaHeight = 50;

    return Scaffold(
      drawer: NavDrawer(
        key: _scaffoldKey,
      ),
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(91, 134, 229, 1),
        actions: [
          FlatButton(
            minWidth: 20,
            child: Text(
              'Sair',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await controller.logout();
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: controller.getMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.connectionState == ConnectionState.none) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Observer(
            builder: (context) {
              return Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height -
                            kToolbarHeight -
                            sendMessageAreaHeight -
                            25,
                        child: ListView.builder(
                          itemCount: controller.messages.length,
                          itemBuilder: (context, i) {
                            return MessageBox(
                              message: controller.messages[i],
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        height: sendMessageAreaHeight,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 5),
                              width: MediaQuery.of(context).size.width - 70,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Digite sua mensagem',
                                ),
                                controller: _messageController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mensagem vazia';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              child: FlatButton(
                                minWidth: 50,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.blue[800],
                                ),
                                onPressed: () async {
                                  if (_messageController.text.isNotEmpty) {
                                    await controller
                                        .postMessage(_messageController.text);
                                    _messageController.clear();
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
