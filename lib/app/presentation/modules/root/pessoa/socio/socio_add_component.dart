import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/presentation/mobx/shared/enuns/enum_load_state.dart';
import 'package:syshouse/app/presentation/mobx/shared/loading_store.dart';

import '../../../../mobx/patrimonio_store.dart';
import '../../../../mobx/socio_store.dart';

class SocioAdd extends StatefulWidget {
  final storePatrimonio = Modular.get<StorePatrimonio>();
  final storeSocio = Modular.get<StoreSocio>();
  final load = Modular.get<LoadingStore>();

  @override
  _SocioAddState createState() {
    return _SocioAddState();
  }
}

class LoadingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class _SocioAddState extends State<SocioAdd> {
  int patrimonioSelected;

  @override
  void initState() {
    super.initState();
    widget.storePatrimonio.list();
  }

  @override
  void dispose() {
    super.dispose();
    Modular.dispose<StorePatrimonio>();
    Modular.dispose<StoreSocio>();
    Modular.dispose<LoadingStore>();
  }

  @override
  void didUpdateWidget(covariant SocioAdd oldWidget) {
    // TODO: implement didUpdateWidget
    print(oldWidget);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, screen) {
        return Container(
          width: screen.maxWidth,
          child: Observer(builder: (_) {
            if (widget.load.loadState == EnumLoadState.initial) {
              return const Text("initial");
            } else if (widget.load.loadState == EnumLoadState.loading) {
              return const Text("Loading");
            } else {
              return Column(
                children: [
                  Spacer(),
                  DropdownButton(
                    value: patrimonioSelected,
                    items: [
                      ...widget.storePatrimonio.reslist
                          .asMap()
                          .entries
                          .map((e) => DropdownMenuItem(
                                child: Text("Item ${e.value.nome}"),
                                value: e.key,
                              ))
                    ],
                    onChanged: (value) => {},
                  ),
                  Spacer(),
                  formSocio(screen),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      RaisedButton(
                          child: Text("Cancelar"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Spacer(),
                      RaisedButton(
                          child: Text("Salvar"),
                          onPressed: () {
                            widget.storeSocio.save(widget.storeSocio.param);
                          }),
                      Spacer(),
                    ],
                  ),
                  Spacer(),
                ],
              );
            }
          }),
        );
      },
    );
  }

  Wrap formSocio(BoxConstraints screen) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nome',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(nome: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Cpf',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(cpf: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Rg',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(rg: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nacionalidade',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(nacionalidade: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Estado Cívil',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(estadoCivil: value),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
          child: ConstrainedBox(
            constraints: BoxConstraints.tight(
              Size(screen.maxWidth * 0.2, 50),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Profissão',
              ),
              onChanged: (value) => widget.storeSocio.changeSocio(
                SocioModel(profissao: value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
// class SocioAdd extends StatefulWidget {
//   @override
//   _SocioAddState createState() => _SocioAddState();
// }

// class _SocioAddState extends State<SocioAdd> {
//   final storePatrimonio = Modular.get<StorePatrimonio>();
//   final storeSocio = Modular.get<StoreSocio>();
//   final load = Modular.get<LoadingStore>();

//   int patrimonioSelected;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, screen) {
//         return Container(
//           width: screen.maxWidth,
//           child: Observer(builder: (_) {
//             if (load.loadState == EnumLoadState.initial) {
//               return const Text("initial");
//             } else if (load.loadState == EnumLoadState.loading) {
//               return const Text("Loading");
//             } else {
//               return Column(
//                 children: [
//                   Spacer(),
//                   DropdownButton(
//                     value: patrimonioSelected,
//                     items: [
//                       ...storePatrimonio.reslist
//                           .asMap()
//                           .entries
//                           .map((e) => DropdownMenuItem(
//                                 child: Text("Item ${e.value.nome}"),
//                                 value: e.key,
//                               ))
//                     ],
//                     onChanged: (value) => {
//                     },
//                   ),
//                   Spacer(),
//                   formSocio(screen),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Spacer(),
//                       RaisedButton(
//                           child: Text("Cancelar"),
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           }),
//                       Spacer(),
//                       RaisedButton(
//                           child: Text("Salvar"),
//                           onPressed: () {
//                             storeSocio.save(storeSocio.param);
//                           }),
//                       Spacer(),
//                     ],
//                   ),
//                   Spacer(),
//                 ],
//               );
//             }
//           }),
//         );
//       },
//     );
//   }

//   Wrap formSocio(BoxConstraints screen) {
//     return Wrap(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Nome',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(nome: value),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Cpf',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(cpf: value),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Rg',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(rg: value),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Nacionalidade',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(nacionalidade: value),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Estado Cívil',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(estadoCivil: value),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: screen.maxWidth * 0.05),
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tight(
//               Size(screen.maxWidth * 0.2, 50),
//             ),
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Profissão',
//               ),
//               onChanged: (value) => storeSocio.changeSocio(
//                 SocioModel(profissao: value),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
