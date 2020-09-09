import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../../../core/network/connectivity_adapter.dart';
import '../../../data/datasources/utils/datasources_api_validation.dart';
import 'root_widget.dart';

class RootModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => http.Client()),
        Bind((i) => ConnectivityAdapterImpl()),
        Bind((i) => ApiValidationImpl()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => RootWidget(),
        ),
      ];
}
