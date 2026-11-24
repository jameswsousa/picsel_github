import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:mobx/mobx.dart';
import 'package:picsel_github/modules/starred/domain/repositories/starred_repository.dart';
import 'package:picsel_github/modules/user/domain/entities/repository_entity.dart';

part 'starred_controller.g.dart';

class StarredController = _StarredControllerBase with _$StarredController;

abstract class _StarredControllerBase with Store {
  final StarredRepository _repository;

  _StarredControllerBase(this._repository);

  @observable
  AppStatesEnum StarredState = AppStatesEnum.noState;

  @observable
  List<RepositoryEntity>? starredRepos;

  @observable
  Failure? failure;

  @action
  Future<void> getStarred(String username) async {
    starredRepos = null;
    StarredState = AppStatesEnum.loading;
    final result = await _repository.getStarredFromUser(username);
    result.fold(
      (l) {
        failure = l;
        StarredState = AppStatesEnum.error;
      },
      (r) {
        starredRepos = r;
        StarredState = AppStatesEnum.loaded;
      },
    );
  }
}
