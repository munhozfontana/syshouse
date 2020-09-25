import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:syshouse/app/presentation/modules/utils/global_snackbar.dart';

import '../../../../../../core/usecases/params.dart';
import '../../../../../domain/entities/socio.dart';
import '../../../../../domain/usecases/socio_usecases.dart';
import '../../../../mobx/shared/enuns/enum_load_state.dart';
import '../../../../mobx/shared/loading_store.dart';

part 'pessoa_list_controller.g.dart';

class PessoaListController = _PessoaListControllerBase
    with _$PessoaListController;

abstract class _PessoaListControllerBase extends Disposable with Store {
  final ListPageSocio listPageSocio;
  final DeleteSocio deleteSocio;
  final LoadingStore loadingStore;

  @observable
  List<Socio> resListSocios = [];

  _PessoaListControllerBase({
    @required this.listPageSocio,
    @required this.deleteSocio,
    @required this.loadingStore,
  });

  @action
  Future<void> init() async {
    loadingStore.setLoadState(EnumLoadState.loading);
    (await listPageSocio(
      Params(
        pagination: Pagination(page: 0, size: 5),
      ),
    ))
        .fold(
      (l) => GlobalScaffold.instance.showSnackBar(l.message),
      (r) => {
        resListSocios = r,
        loadingStore.setLoadState(EnumLoadState.loaded),
      },
    );
  }

  @action
  Future<void> removeItem(Socio socio) async {
    loadingStore.setLoadState(EnumLoadState.loading);

    var params =
        Params(pagination: Pagination(page: 0, size: 5), socioModel: socio);

    (await deleteSocio(params))
        .andThen(
          (await listPageSocio(params)),
        )
        .fold(
          (l) => {
            GlobalScaffold.instance.showSnackBar(l.message),
            loadingStore.setLoadState(EnumLoadState.loaded),
          },
          (r) => {
            resListSocios = r,
            loadingStore.setLoadState(EnumLoadState.loaded),
          },
        );
  }

  @override
  void dispose() {}
}
