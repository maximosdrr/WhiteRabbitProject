// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegistrationController = BindInject(
  (i) => RegistrationController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrationController on _RegistrationControllerBase, Store {
  final _$errorMessageAtom =
      Atom(name: '_RegistrationControllerBase.errorMessage');

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

  final _$errorAtom = Atom(name: '_RegistrationControllerBase.error');

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

  final _$loadAtom = Atom(name: '_RegistrationControllerBase.load');

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

  final _$successAtom = Atom(name: '_RegistrationControllerBase.success');

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
