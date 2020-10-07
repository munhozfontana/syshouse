import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../mobx/loading_store.dart';

part 'socio_patrimonio_add_controller.g.dart';

class SocioPatrimonioAddController = _SocioPatrimonioAddControllerBase
    with _$SocioPatrimonioAddController;

abstract class _SocioPatrimonioAddControllerBase with Store {
  final LoadingStore loadingStore;

  _SocioPatrimonioAddControllerBase({
    @required this.loadingStore,
  });

  @action
  Future<void> init() async {}
}
