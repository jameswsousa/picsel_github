// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starred_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StarredController on _StarredControllerBase, Store {
  late final _$StarredStateAtom =
      Atom(name: '_StarredControllerBase.StarredState', context: context);

  @override
  AppStatesEnum get StarredState {
    _$StarredStateAtom.reportRead();
    return super.StarredState;
  }

  @override
  set StarredState(AppStatesEnum value) {
    _$StarredStateAtom.reportWrite(value, super.StarredState, () {
      super.StarredState = value;
    });
  }

  late final _$starredReposAtom =
      Atom(name: '_StarredControllerBase.starredRepos', context: context);

  @override
  List<RepositoryEntity>? get starredRepos {
    _$starredReposAtom.reportRead();
    return super.starredRepos;
  }

  @override
  set starredRepos(List<RepositoryEntity>? value) {
    _$starredReposAtom.reportWrite(value, super.starredRepos, () {
      super.starredRepos = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_StarredControllerBase.failure', context: context);

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

  late final _$getStarredAsyncAction =
      AsyncAction('_StarredControllerBase.getStarred', context: context);

  @override
  Future<void> getStarred(String username) {
    return _$getStarredAsyncAction.run(() => super.getStarred(username));
  }

  @override
  String toString() {
    return '''
StarredState: ${StarredState},
starredRepos: ${starredRepos},
failure: ${failure}
    ''';
  }
}
