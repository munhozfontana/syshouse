import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/usecases/params.dart';
import '../../../../../../domain/entities/socio.dart';
import '../../../../../../domain/usecases/socio_usecases.dart';
import '../../../../../mobx/enuns/enum_load_state.dart';
import '../../../../../mobx/loading_store.dart';
import '../../../../utils/global_snackbar.dart';

part 'socio_list_controller.g.dart';

class SocioListController = _SocioListControllerBase with _$SocioListController;

abstract class _SocioListControllerBase extends Disposable with Store {
  final ListPageSocio listPageSocio;
  final DeleteSocio deleteSocio;
  final LoadingStore loadingStore;

  @observable
  List<Socio> resListSocios = [];

  _SocioListControllerBase({
    @required this.listPageSocio,
    @required this.deleteSocio,
    @required this.loadingStore,
  });

  // @action
  Future<void> init() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    (await listPageSocio(
      Params(
        pagination: Pagination(page: 0, size: 5),
      ),
    ))
        .fold(
      (l) => {
        loadingStore.setLoadState(EnumLoadState.loaded),
        GlobalScaffold.instance.showSnackBar(l.message)
      },
      (r) => {
        resListSocios = r,
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }

  // @action
  Future<void> removeItem(Socio socio) async {
    var params = Params(
      pagination: Pagination(page: 0, size: 5),
      socioModel: socio,
    );

    loadingStore.setLoadState(EnumLoadState.loading);

    var resDeleteSocio = await deleteSocio(params);

    var resListPageSocio = await listPageSocio(params);

    loadingStore.setLoadState(EnumLoadState.loaded);

    resDeleteSocio
        .andThen(
          (resListPageSocio),
        )
        .fold(
          (l) => {
            GlobalScaffold.instance.showSnackBar(l.message),
          },
          (r) => {
            resListSocios = r,
          },
        );
  }

  @override
  void dispose() {}
}
