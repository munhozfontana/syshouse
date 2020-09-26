import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/presentation/components/core/drawer_component.dart';

import 'utils/global_snackbar.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Modular.initialRoute,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffKey,
          drawer: DrawerComponent(),
          body: child,
        );
      },
    );
  }
}
