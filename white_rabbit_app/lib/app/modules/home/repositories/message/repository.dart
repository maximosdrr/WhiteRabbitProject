import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:white_rabbit_app/app/helpers/pickers/url_picker.dart';
import 'package:white_rabbit_app/app/models/message.dart';

class MessageRepository {
  Future<List<Message>> getMessages(token, currentUserId) async {
    List<Message> messages = [];
    var response =
        await http.get('${UrlPicker.baseUrl}/messenger/find', headers: {
      'Authorization': token,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var decodedResponse = json.decode(response.body);
      for (var message in decodedResponse) {
        messages.add(Message.fromJson(message, currentUserId));
      }
      return messages;
    } else if (response.statusCode == 401) {
      throw new Exception(
        'Você não está autorizado a receber mensagens, por favor faça login novamente',
      );
    } else {
      throw new Exception(
        'Erro ao tentar recuperar mensagens, Status code: ${response.statusCode}',
      );
    }
  }

  postMessage(String content, String token) async {
    var response =
        await http.post('${UrlPicker.baseUrl}/messenger/insert', body: {
      'content': content,
    }, headers: {
      'Authorization': token,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Nova mensagem enviada');
    } else if (response.statusCode == 401) {
      throw new Exception(
          'Você não está autorizado a enviar está mensagem, tente fazer login novamente');
    } else {
      throw new Exception(
        'Erro ao tentar recuperar mensagens, Status code: ${response.statusCode}',
      );
    }
  }
}
