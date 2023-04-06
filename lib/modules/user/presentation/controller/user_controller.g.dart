// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on _UserControllerBase, Store {
  late final _$userStateAtom =
      Atom(name: '_UserControllerBase.userState', context: context);

  @override
  AppStatesEnum get userState {
    _$userStateAtom.reportRead();
    return super.userState;
  }

  @override
  set userState(AppStatesEnum value) {
    _$userStateAtom.reportWrite(value, super.userState, () {
      super.userState = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_UserControllerBase.user', context: context);

  @override
  UserEntity? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserEntity? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$usernameAtom =
      Atom(name: '_UserControllerBase.username', context: context);

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  late final _$userslistAtom =
      Atom(name: '_UserControllerBase.userslist', context: context);

  @override
  List<UserEntity>? get userslist {
    _$userslistAtom.reportRead();
    return super.userslist;
  }

  @override
  set userslist(List<UserEntity>? value) {
    _$userslistAtom.reportWrite(value, super.userslist, () {
      super.userslist = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_UserControllerBase.failure', context: context);

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

  late final _$getUserAsyncAction =
      AsyncAction('_UserControllerBase.getUser', context: context);

  @override
  Future<void> getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  @override
  String toString() {
    return '''
userState: ${userState},
user: ${user},
username: ${username},
userslist: ${userslist},
failure: ${failure}
    ''';
  }
}
