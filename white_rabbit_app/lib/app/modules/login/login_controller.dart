import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_rabbit_app/app/models/accessToken.dart';
import 'package:white_rabbit_app/app/models/user.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/auth/repository.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/prefs/repository.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

final AuthRepository _authRepository = Modular.get();
final PrefsRepository _prefsRepository = Modular.get();

abstract class _LoginControllerBase with Store {
  @observable
  String errorMessage = '';

  @observable
  bool error = false;

  @observable
  bool load = false;

  @observable
  bool success = false;

  @action
  login(username, password) async {
    if (!load) {
      try {
        _setLoad();
        await Future.delayed(Duration(seconds: 2));
        Token token = await _authRepository.authenticate(username, password);
        await _prefsRepository.setToken(token.accessToken);
        User user = await _authRepository.getProfile(token.accessToken);
        await _prefsRepository.setProfile(user);
        _setSuccess();
        Modular.to
            .pushNamedAndRemoveUntil('/home', ModalRoute.withName('/home'));
        print('Terminado: Login de usuario');
      } catch (e) {
        await _prefsRepository.clearToken();
        await _prefsRepository.clearProfile();
        _setErro(e);
      }
    }
  }

  @action
  Future<bool> isAuthenticated() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      if (!await _prefsRepository.tokenExists()) {
        return false;
      }

      if (!await _prefsRepository.profileExists()) {
        return false;
      }
      String token = await _prefsRepository.getToken();
      if (!await _authRepository.validateToken(token)) {
        return false;
      }
      return true;
    } catch (e) {
      print(e);
      _setErro(e);
      return false;
    }
  }

  _setSuccess() {
    this.success = true;
    this.load = false;
    this.error = false;
  }

  _setLoad() {
    this.success = false;
    this.load = true;
    this.error = false;
    Modular.to.pushNamed('/load');
  }

  _setErro(message) {
    this.success = false;
    this.load = false;
    this.error = true;
    this.errorMessage = message.toString().replaceAll('Exception:', '');
    Modular.to.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
  }

  @action
  teste() async {
    try {
      User profile = await _prefsRepository.getProfile();
      print(profile.id);
    } catch (e) {
      print(e);
    }
  }
}
