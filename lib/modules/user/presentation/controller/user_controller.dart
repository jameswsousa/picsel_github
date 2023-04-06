import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/errors/failures.dart';
import '../../data/repositories/user_repository_impl.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/user_entity.dart';

part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final UserRepositoryImpl _repository;

  _UserControllerBase(this._repository);

  @observable
  AppStatesEnum userState = AppStatesEnum.noState;

  @observable
  UserEntity? user;

  @observable
  String username = 'mojombo';

  @observable
  List<UserEntity>? userslist;

  @observable
  Failure? failure;

  @action
  Future<void> getUser() async {
    user = null;
    final result = await _repository.getUser(username);
    result.fold((l) {
      failure = l;
      userState = AppStatesEnum.error;
    }, (r) {
      user = r;
      userState = AppStatesEnum.loaded;
    });
  }
}
