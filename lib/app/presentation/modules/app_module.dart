import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:syshouse/app/presentation/mobx/shared/show_error.dart';

import '../../../core/network/connectivity_adapter.dart';
import '../../data/datasources/utils/datasources_api_validation.dart';
import '../mobx/shared/loading_store.dart';
import 'app_widget.dart';
import 'root/root_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => http.Client(), lazy: true),
        Bind((i) => ConnectivityAdapterImpl(), lazy: true),
        Bind((i) => ApiValidationImpl(), lazy: true),
        Bind((i) => LoadingStore(), lazy: true),
        Bind((i) => ShowError(), lazy: true),
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
