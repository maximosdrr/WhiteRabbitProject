import 'package:shared_preferences/shared_preferences.dart';
import 'package:white_rabbit_app/app/models/user.dart';

class PrefsRepository {
  setToken(jwt) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('token', jwt);
  }

  getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  clearToken() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }

  Future<bool> tokenExists() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('token') || prefs.getString('token') == '') {
      return false;
    }

    return true;
  }

  setProfile(User user) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('icon', user.icon);
    prefs.setString('id', user.id);
    prefs.setString('name', user.name);
    prefs.setString('username', user.username);
  }

  getProfile() async {
    var prefs = await SharedPreferences.getInstance();
    String icon = prefs.getString('icon');
    String id = prefs.getString('id');
    String name = prefs.getString('name');
    String username = prefs.getString('username');

    return new User(icon: icon, id: id, name: name, username: username);
  }

  clearProfile() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('icon');
    prefs.remove('id');
    prefs.remove('name');
    prefs.remove('username');
  }

  profileExists() async {
    var prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('icon')) {
      return false;
    }
    if (!prefs.containsKey('id')) {
      return false;
    }

    if (!prefs.containsKey('name')) {
      return false;
    }

    if (!prefs.containsKey('username')) {
      return false;
    }

    return true;
  }
}
