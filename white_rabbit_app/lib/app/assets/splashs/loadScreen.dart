import 'package:flutter/material.dart';

class LoadScreen extends StatefulWidget {
  final String text;
  LoadScreen({Key key, this.text: 'Carregando...'}) : super(key: key);

  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircularProgressIndicator(),
            ),
            Container(
              child: Text(
                'Carregando',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
