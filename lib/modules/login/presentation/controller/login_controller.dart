import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/errors/failures.dart';
import 'package:mobx/mobx.dart';
import 'package:picsel_github/core/utils/validation.dart';
import 'package:picsel_github/modules/login/data/repositories/login_repository_impl.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginRepositoryImpl _repository;

  _LoginControllerBase(this._repository);

  @observable
  AppStatesEnum loginState = AppStatesEnum.noState;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool isTappedButton = false;

  @observable
  Failure? failure;

  @computed
  String? get errorTextEmail => Validation.isValidEmail(email: email);

  @computed
  String? get errorTextPassword => Validation.isValidPassword(password);
  @computed
  bool get isFormValid =>
      errorTextEmail == null &&
      errorTextPassword == null &&
      email != null &&
      password != null;

  @action
  Future<void> login() async {
    final result = await _repository.login(email!, password!);
    result.fold((l) {
      failure = l;
      loginState = AppStatesEnum.error;
    }, (r) {
      if (r) loginState = AppStatesEnum.loaded;
    });
  }

  @action
  void cleanFields() {
    email = null;
    password = null;
  }
}
