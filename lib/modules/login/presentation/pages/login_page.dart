import 'package:flutter/material.dart';
import 'package:picsel_github/core/components/base_scaffold.dart';
import 'package:picsel_github/core/components/default_alert_dialog.dart';
import 'package:picsel_github/core/components/default_button.dart';
import 'package:picsel_github/core/components/default_text_field.dart';
import 'package:picsel_github/core/enums/app_states.dart';
import 'package:picsel_github/core/theme/colors.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/core/theme/icons.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picsel_github/modules/login/presentation/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: AppColors.primary,
      hasDrawer: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AppIcons.logo,
                color: Colors.white,
                height: 150,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (context) {
                return DefaultTextField(
                  label: 'E-mail',
                  textInputAction: TextInputAction.next,
                  text: _controller.email,
                  errorText: _controller.isTappedButton
                      ? _controller.errorTextEmail
                      : null,
                  onchanged: (value) {
                    _controller.email = value;
                  },
                );
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (context) {
                return DefaultTextField(
                  onEditingComplete: _controller.isFormValid
                      ? () => LoginFunction(context)
                      : null,
                  textInputAction: TextInputAction.done,
                  ispassword: true,
                  label: 'Senha',
                  text: _controller.password,
                  errorText: _controller.isTappedButton
                      ? _controller.errorTextPassword
                      : null,
                  onchanged: (value) {
                    _controller.password = value;
                  },
                );
              }),
              SizedBox(
                height: 20,
              ),
              Observer(builder: (context) {
                return DefaultButton(
                    color: _controller.isFormValid ? AppColors.success : null,
                    textColor: _controller.isFormValid ? Colors.white : null,
                    label: 'Entrar',
                    onPressed: _controller.isFormValid
                        ? () => LoginFunction(context)
                        : _controller.isTappedButton
                            ? null
                            : () => _controller.isTappedButton = true);
              })
            ]),
      ),
    );
  }

  void LoginFunction(BuildContext context) async {
    DefaultAlertDialog.showLoading(context: context);
    await _controller.login();
    if (_controller.loginState == AppStatesEnum.error) {
      Modular.to.pop();
      DefaultAlertDialog.showError(
          context: context, failure: _controller.failure!);
    }
    if (_controller.loginState == AppStatesEnum.loaded) ;
    {
      Modular.to.pop();
      Modular.to.navigate('/user');
      _controller.cleanFields();
    }
  }
}
