import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home/home_module.dart';
import 'patrimonio/patrimonio_module.dart';
import 'pessoa/pessoa_module.dart';

class RootWidget extends StatefulWidget {
  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  num pageSelect = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("System House"),
        backgroundColor: Colors.blueAccent,
      ),
      body: IndexedStack(
        index: pageSelect,
        children: [
          RouterOutlet(module: HomeModule()),
          RouterOutlet(
            module: PessoaModule(),
            initialRoute: 'socio/list',
          ),
          RouterOutlet(module: PatrimonioModule()),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => {
                setState(() {
                  pageSelect = 0;
                })
              },
            ),
            ListTile(
              title: Text('Pessoas'),
              onTap: () => {
                setState(() {
                  pageSelect = 1;
                })
              },
            ),
            ListTile(
              title: Text('Patrimonio'),
              onTap: () => {
                setState(() {
                  pageSelect = 2;
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
