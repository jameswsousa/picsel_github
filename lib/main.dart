import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:picsel_github/modules/root/app.dart';
import 'package:picsel_github/modules/root/app_module.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR');
  runApp(ModularApp(module: AppModule(), child: const App()));
}
