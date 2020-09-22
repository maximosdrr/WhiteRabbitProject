import 'package:white_rabbit_app/app/models/user.dart';

class Message {
  String content;
  User user;
  String id;
  String createdAt;
  bool messageIsMine;

  Message(
      {this.content,
      this.messageIsMine: false,
      this.user,
      this.id,
      this.createdAt});

  Message.fromJson(Map<String, dynamic> json, currentId) {
    content = json['content'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;

    id = json['id'];
    createdAt = json['createdAt'];
    messageIsMine = user.id == currentId ? true : false;
  }

  factory Message.fromWebSocket(response, currentId) {
    print(response);
    User user = new User(
        icon: response['user']['icon'],
        id: response['user']['id'],
        name: response['user']['name'],
        username: response['user']['username']);
    Message message = new Message(
      content: response['content'],
      createdAt: DateTime.now().toUtc().toString(),
      id: response['id'],
      user: user,
      messageIsMine: currentId == user.id ? true : false,
    );
    print(response['createdAt']);
    print(message.createdAt);
    return message;
  }
}
