import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:picsel_github/modules/login/login_module.dart';
import 'package:picsel_github/modules/search/search_module.dart';
import 'package:picsel_github/modules/starred/starred_module.dart';
import 'package:picsel_github/modules/user/user_module.dart';

import '../../core/network/data_connection_checker.dart';
import '../../core/network/network_info.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => NetworkInfoImpl(i())),
        Bind((i) => DataConnectionChecker()),
        Bind((i) => HttpClient()),
        Bind((i) => Client()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: LoginModule()),
        ModuleRoute('/user', module: UserModule()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/starred', module: StarredModule()),
        ModuleRoute('/search', module: SearchModule()),
      ];
}
