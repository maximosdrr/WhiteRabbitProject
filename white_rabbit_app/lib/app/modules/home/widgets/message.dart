import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:white_rabbit_app/app/helpers/format/date.dart';
import 'package:white_rabbit_app/app/helpers/pickers/icon_picker.dart';
import 'package:white_rabbit_app/app/models/message.dart';

class MessageBox extends StatefulWidget {
  @required
  final Message message;
  MessageBox({Key key, this.message}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.message.messageIsMine
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: widget.message.messageIsMine ? 0 : 10,
          right: widget.message.messageIsMine ? 10 : 0,
          bottom: 10,
        ),
        width: 250,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            widget.message.messageIsMine
                ? Container()
                : Row(
                    children: [
                      SvgPicture.asset(
                        IconPicker.getSvgPath(widget.message.user.icon),
                        width: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          widget.message.user.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: AutoSizeText(
                widget.message.content,
                style: TextStyle(
                  fontSize: 18,
                ),
                maxFontSize: 18,
                minFontSize: 15,
              ),
              alignment: Alignment.topLeft,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.topRight,
              child: AutoSizeText(
                DateFormater.getDate(widget.message.createdAt),
                textAlign: TextAlign.right,
              ),
            )
          ],
        ),
      ),
    );
  }
}
