// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$errorMessageAtom = Atom(name: '_LoginControllerBase.errorMessage');

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

  final _$errorAtom = Atom(name: '_LoginControllerBase.error');

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

  final _$loadAtom = Atom(name: '_LoginControllerBase.load');

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

  final _$successAtom = Atom(name: '_LoginControllerBase.success');

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

  final _$loginAsyncAction = AsyncAction('_LoginControllerBase.login');

  @override
  Future login(dynamic username, dynamic password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$isAuthenticatedAsyncAction =
      AsyncAction('_LoginControllerBase.isAuthenticated');

  @override
  Future<bool> isAuthenticated() {
    return _$isAuthenticatedAsyncAction.run(() => super.isAuthenticated());
  }

  final _$testeAsyncAction = AsyncAction('_LoginControllerBase.teste');

  @override
  Future teste() {
    return _$testeAsyncAction.run(() => super.teste());
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
error: ${error},
load: ${load},
success: ${success}
    ''';
  }
}
