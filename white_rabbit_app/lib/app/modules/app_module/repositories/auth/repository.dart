import 'dart:convert';

import 'package:flutter_modular/flutter_modular_annotations.dart';
import 'package:http/http.dart' as http;
import 'package:white_rabbit_app/app/helpers/pickers/url_picker.dart';
import 'package:white_rabbit_app/app/models/accessToken.dart';
import 'package:white_rabbit_app/app/models/user.dart';

class AuthRepository {
  authenticate(String username, String password) async {
    var response = await http.post(
      '${UrlPicker.baseUrl}/auth/login',
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Token.fromJson(json.decode(response.body));
    } else if (response.statusCode == 401) {
      throw new Exception('Usuario ou senha incorretos');
    } else {
      throw new Exception(
          'A requisição foi rejeitada, status da requisição: ${response.statusCode}');
    }
  }

  register(String name, String username, String password, String icon) async {
    var response = await http.post('${UrlPicker.baseUrl}/user/insert', body: {
      'username': username,
      'password': password,
      'name': name,
      'icon': icon,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw new Exception(
          'A requisição foi rejeitada, status da requisição: ${response.statusCode}');
    }
  }

  getProfile(String token) async {
    var response =
        await http.get('${UrlPicker.baseUrl}/auth/getProfile', headers: {
      'Authorization': token,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw new Exception(
          'A requisição foi rejeitada, status da requisição: ${response.statusCode}');
    }
  }

  Future<bool> validateToken(String token) async {
    var response =
        await http.get('${UrlPicker.baseUrl}/auth/getProfile', headers: {
      'Authorization': token,
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
