import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import 'network/data_connection_checker.dart';
import 'network/network_info.dart';

/// Dependências compartilhadas por todos os módulos.
///
/// No flutter_modular 6 o que é registrado no AppModule não fica visível para
/// os outros módulos; por isso cada módulo importa este (`imports`), e o que
/// está em `exportedBinds` é criado uma vez só e compartilhado entre eles.
class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(DataConnectionChecker.new);
    i.addLazySingleton<NetworkInfo>(NetworkInfoImpl.new);
    i.addLazySingleton(Client.new);
  }
}
