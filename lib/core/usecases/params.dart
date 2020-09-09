import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../app/data/models/contato_model.dart';
import '../../app/data/models/dependente_model.dart';
import '../../app/data/models/despesa_model.dart';
import '../../app/data/models/localizacao_model.dart';
import '../../app/data/models/midia_model.dart';
import '../../app/data/models/movimentacao_model.dart';
import '../../app/data/models/municipio_model.dart';
import '../../app/data/models/pagador_model.dart';
import '../../app/data/models/pagamento_model.dart';
import '../../app/data/models/pagamento_patrimonio_model.dart';
import '../../app/data/models/patrimonio_model.dart';
import '../../app/data/models/recebimento_model.dart';
import '../../app/data/models/recebimento_patrimonio_model.dart';
import '../../app/data/models/renda_model.dart';
import '../../app/data/models/socio_model.dart';
import '../../app/data/models/socio_patrimonio_model.dart';
import '../../app/data/models/tipo_despesa_model.dart';
import '../../app/data/models/tipo_patrimonio_model.dart';
import '../../app/data/models/tipo_renda_model.dart';

class Params extends Equatable {
  final TipoRendaModel tipoRendaModel;
  final TipoDespesaModel tipoDespesaModel;
  final TipoPatrimonioModel tipoPatrimonioModel;
  final SocioPatrimonioModel socioPatrimonioModel;
  final ContatoModel contatoModel;
  final Pagination pagination;
  final DependenteModel dependenteModel;
  final DespesaModel despesaModel;
  final LocalizacaoModel localizacaoModel;
  final MidiaModel midiaModel;
  final SocioModel socioModel;
  final MovimentacaoModel movimentacaoModel;
  final MunicipioModel municipioModel;
  final PagadorModel pagadorModel;
  final PagamentoPatrimonioModel pagamentoPatrimonioModel;
  final RecebimentoPatrimonioModel recebimentoPatrimonioModel;
  final RendaModel rendaModel;
  final RecebimentoModel recebimentoModel;
  final PagamentoModel pagamentoModel;
  final PatrimonioModel patrimonioModel;

  Params({
    this.tipoRendaModel,
    this.socioPatrimonioModel,
    this.pagination,
    this.contatoModel,
    this.dependenteModel,
    this.despesaModel,
    this.localizacaoModel,
    this.midiaModel,
    this.socioModel,
    this.movimentacaoModel,
    this.municipioModel,
    this.pagadorModel,
    this.pagamentoPatrimonioModel,
    this.recebimentoPatrimonioModel,
    this.rendaModel,
    this.recebimentoModel,
    this.pagamentoModel,
    this.patrimonioModel,
    this.tipoDespesaModel,
    this.tipoPatrimonioModel,
  });

  @override
  List<Object> get props => [
        contatoModel,
        tipoRendaModel,
        socioPatrimonioModel,
        pagination,
        dependenteModel,
        despesaModel,
        localizacaoModel,
        midiaModel,
        socioModel,
        movimentacaoModel,
        municipioModel,
        pagadorModel,
        pagamentoPatrimonioModel,
        recebimentoPatrimonioModel,
        rendaModel,
        recebimentoModel,
        pagamentoModel,
        patrimonioModel,
        tipoDespesaModel,
        tipoPatrimonioModel,
      ];
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Pagination {
  int page;
  int size;

  Pagination({
    @required this.page,
    @required this.size,
  });
}
