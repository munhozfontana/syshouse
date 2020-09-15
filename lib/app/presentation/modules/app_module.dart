import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';
import 'package:syshouse/app/presentation/modules/root/root_widget.dart';

import '../../../core/network/connectivity_adapter.dart';
import '../../data/datasources/utils/datasources_api_validation.dart';
import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => http.Client()),
        Bind((i) => ConnectivityAdapterImpl()),
        Bind((i) => ApiValidationImpl()),
        Bind((i) => LoadingStore()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.initialRoute,
          child: (context, args) => RootWidget(),
        ),
      ];
}
