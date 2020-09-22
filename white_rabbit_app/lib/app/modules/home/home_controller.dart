import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:white_rabbit_app/app/helpers/pickers/url_picker.dart';
import 'package:white_rabbit_app/app/models/user.dart';
import 'package:white_rabbit_app/app/models/message.dart';
import 'package:white_rabbit_app/app/modules/app_module/repositories/prefs/repository.dart';
import 'package:white_rabbit_app/app/modules/home/repositories/message/repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PrefsRepository _prefsRepository = Modular.get();
  final MessageRepository _messageRepository = Modular.get();

  @observable
  var messages = ObservableList<Message>();

  @observable
  User profile = new User();

  @observable
  String errorMessage = '';

  @observable
  bool error = false;

  @observable
  bool load = false;

  @observable
  bool success = false;

  @action
  getProfile() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      this.profile = await _prefsRepository.getProfile();
    } catch (e) {
      print('Erro ao tentar recuperar usuario');
    }
  }

  @action
  getMessages() async {
    try {
      String token = await _prefsRepository.getToken();
      User user = await _prefsRepository.getProfile();
      var socket = _getSocket();
      _socketListenMenssage(socket, user.id);

      var result = await _messageRepository.getMessages(
        token,
        user.id,
      );
      messages = result.asObservable();
    } catch (e) {
      print(e);
    }
  }

  @action
  postMessage(String content) async {
    try {
      String token = await _prefsRepository.getToken();
      await _messageRepository.postMessage(content, token);
    } catch (e) {
      print(e);
    }
  }

  @action
  logout() async {
    try {
      _setLoad();
      await Future.delayed(Duration(seconds: 2));
      await this._prefsRepository.clearProfile();
      await this._prefsRepository.clearToken();
      _setSuccess();
      Modular.to.pushNamedAndRemoveUntil('/', ModalRoute.withName('/'));
    } catch (e) {
      _setErro(e);
      print(e);
    }
  }

  _socketListenMenssage(IO.Socket socket, String currentUserId) {
    socket.connect();
    print('O socket está ouvindo as novas mensagens');
    socket.on('msgToClient', (response) {
      Message message = Message.fromWebSocket(response, currentUserId);
      this._pushMessage(message);
      print('Nova mensagem recebida');
    });
  }

  IO.Socket _getSocket() {
    IO.Socket socket = IO.io(UrlPicker.baseUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    return socket;
  }

  _pushMessage(Message message) {
    print('Adicionando mensagem');
    messages.add(message);
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
    this.errorMessage = message.toString();
  }
}
