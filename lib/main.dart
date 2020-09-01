import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/presentation/modules/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load('.env');
  runApp(ModularApp(
    module: AppModule(),
  ));
}
