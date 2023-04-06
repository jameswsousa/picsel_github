import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:picsel_github/modules/search/domain/entities/user_result_entity.dart';

import '../../data/repositories/search_repository_impl.dart';
import 'package:mobx/mobx.dart';

part 'search_controller.g.dart';

class SearchController = _SearchControllerBase with _$SearchController;

abstract class _SearchControllerBase with Store {
  final SearchRepositoryImpl _repository;

  _SearchControllerBase(this._repository);

  @observable
  String? text;

  @observable
  List<UserResultEntity> searchResults = [];

  @observable
  AppStatesEnum searchState = AppStatesEnum.noState;

  @observable
  Failure? failure;

  @action
  Future<void> search() async {
    searchState = AppStatesEnum.loading;
    searchResults = [];
    final result = await _repository.searchUsers(text!);
    result.fold((l) {
      failure = l;
      searchState = AppStatesEnum.error;
    }, (r) {
      searchResults = r;
      searchState = AppStatesEnum.loaded;
    });
  }
}
