// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$messagesAtom = Atom(name: '_HomeControllerBase.messages');

  @override
  ObservableList<Message> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<Message> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$profileAtom = Atom(name: '_HomeControllerBase.profile');

  @override
  User get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(User value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_HomeControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$errorAtom = Atom(name: '_HomeControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadAtom = Atom(name: '_HomeControllerBase.load');

  @override
  bool get load {
    _$loadAtom.reportRead();
    return super.load;
  }

  @override
  set load(bool value) {
    _$loadAtom.reportWrite(value, super.load, () {
      super.load = value;
    });
  }

  final _$successAtom = Atom(name: '_HomeControllerBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$getProfileAsyncAction = AsyncAction('_HomeControllerBase.getProfile');

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$getMessagesAsyncAction =
      AsyncAction('_HomeControllerBase.getMessages');

  @override
  Future getMessages() {
    return _$getMessagesAsyncAction.run(() => super.getMessages());
  }

  final _$postMessageAsyncAction =
      AsyncAction('_HomeControllerBase.postMessage');

  @override
  Future postMessage(String content) {
    return _$postMessageAsyncAction.run(() => super.postMessage(content));
  }

  final _$logoutAsyncAction = AsyncAction('_HomeControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
messages: ${messages},
profile: ${profile},
errorMessage: ${errorMessage},
error: ${error},
load: ${load},
success: ${success}
    ''';
  }
}
