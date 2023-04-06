// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginControllerBase, Store {
  Computed<String?>? _$errorTextEmailComputed;

  @override
  String? get errorTextEmail => (_$errorTextEmailComputed ??= Computed<String?>(
          () => super.errorTextEmail,
          name: '_LoginControllerBase.errorTextEmail'))
      .value;
  Computed<String?>? _$errorTextPasswordComputed;

  @override
  String? get errorTextPassword => (_$errorTextPasswordComputed ??=
          Computed<String?>(() => super.errorTextPassword,
              name: '_LoginControllerBase.errorTextPassword'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginControllerBase.isFormValid'))
          .value;

  late final _$loginStateAtom =
      Atom(name: '_LoginControllerBase.loginState', context: context);

  @override
  AppStatesEnum get loginState {
    _$loginStateAtom.reportRead();
    return super.loginState;
  }

  @override
  set loginState(AppStatesEnum value) {
    _$loginStateAtom.reportWrite(value, super.loginState, () {
      super.loginState = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_LoginControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginControllerBase.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$isTappedButtonAtom =
      Atom(name: '_LoginControllerBase.isTappedButton', context: context);

  @override
  bool get isTappedButton {
    _$isTappedButtonAtom.reportRead();
    return super.isTappedButton;
  }

  @override
  set isTappedButton(bool value) {
    _$isTappedButtonAtom.reportWrite(value, super.isTappedButton, () {
      super.isTappedButton = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_LoginControllerBase.failure', context: context);

  @override
  Failure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginControllerBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase', context: context);

  @override
  void cleanFields() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.cleanFields');
    try {
      return super.cleanFields();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loginState: ${loginState},
email: ${email},
password: ${password},
isTappedButton: ${isTappedButton},
failure: ${failure},
errorTextEmail: ${errorTextEmail},
errorTextPassword: ${errorTextPassword},
isFormValid: ${isFormValid}
    ''';
  }
}
