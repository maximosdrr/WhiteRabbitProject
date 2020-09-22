import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/auth/repository.dart';
import 'package:white_rabbit_app/app/modules/login/login_controller.dart';

part 'registration_controller.g.dart';

@Injectable()
class RegistrationController = _RegistrationControllerBase
    with _$RegistrationController;

abstract class _RegistrationControllerBase with Store {
  AuthRepository _authRepository = Modular.get();
  LoginController _loginController = Modular.get();

  @observable
  String errorMessage = '';

  @observable
  bool error = false;

  @observable
  bool load = false;

  @observable
  bool success = false;

  registration(
      String name, String username, String password, String icon) async {
    try {
      if (!load) {
        _setLoad();
        await Future.delayed(Duration(seconds: 2));
        await _authRepository.register(name, username, password, icon);
        await _loginController.login(username, password);
        _setSuccess();
      }
    } catch (e) {
      print(e);
      _setErro(e);
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
    Modular.to.pushNamedAndRemoveUntil(
        '/registration', ModalRoute.withName('/registration'));
  }
}
