import 'package:white_rabbit_chat/app/shared/constants/loren_ipsum.dart';

class MessageModel {
  final String message;
  final bool messageIsMine;
  final bool authorOnline;
  final String sentAt;
  final String author;
  final String authorIcon;

  MessageModel(
      {this.authorOnline,
      this.message,
      this.messageIsMine,
      this.sentAt,
      this.authorIcon: 'rabbit',
      this.author});

  static lorenIpsumMessageForYourself({sentAt: '19:44'}) => new MessageModel(
        authorOnline: true,
        author: 'Eu',
        message: LorenIpsun.getBigString(),
        messageIsMine: true,
        sentAt: sentAt,
        authorIcon: 'rabbit',
      );
  static lorenIpsumMessage({
    authorOnline: true,
    author: 'Hiran Junior',
    sentAt: '19:44',
    authorIcon: 'rabbit',
  }) =>
      new MessageModel(
          authorOnline: authorOnline,
          author: author,
          message: LorenIpsun.getBigString(),
          messageIsMine: false,
          sentAt: sentAt,
          authorIcon: authorIcon);
}
