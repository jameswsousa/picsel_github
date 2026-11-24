import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/login/login_module.dart';
import 'package:picsel_github/modules/search/search_module.dart';
import 'package:picsel_github/modules/starred/starred_module.dart';
import 'package:picsel_github/modules/user/user_module.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/user', module: UserModule());
    r.module('/login', module: LoginModule());
    r.module('/starred', module: StarredModule());
    r.module('/search', module: SearchModule());
  }
}
