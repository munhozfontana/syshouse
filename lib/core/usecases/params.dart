import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../app/domain/entities/contato.dart';
import '../../app/domain/entities/dependente.dart';
import '../../app/domain/entities/despesa.dart';
import '../../app/domain/entities/localizacao.dart';
import '../../app/domain/entities/midia.dart';
import '../../app/domain/entities/movimentacao.dart';
import '../../app/domain/entities/municipio.dart';
import '../../app/domain/entities/pagador.dart';
import '../../app/domain/entities/pagamento.dart';
import '../../app/domain/entities/pagamento_patrimonio.dart';
import '../../app/domain/entities/patrimonio.dart';
import '../../app/domain/entities/recebimento.dart';
import '../../app/domain/entities/recebimento_patrimonio.dart';
import '../../app/domain/entities/renda.dart';
import '../../app/domain/entities/socio.dart';
import '../../app/domain/entities/socio_patrimonio.dart';
import '../../app/domain/entities/tipo_despesa.dart';
import '../../app/domain/entities/tipo_patrimonio.dart';
import '../../app/domain/entities/tipo_renda.dart';

class Params extends Equatable {
  final TipoRenda tipoRenda;
  final TipoDespesa tipoDespesa;
  final TipoPatrimonio tipoPatrimonio;
  final SocioPatrimonio socioPatrimonio;
  final Contato contato;
  final Pagination pagination;
  final Dependente dependente;
  final Despesa despesa;
  final Localizacao localizacao;
  final Midia midia;
  final Socio socio;
  final Movimentacao movimentacao;
  final Municipio municipio;
  final Pagador pagador;
  final PagamentoPatrimonio pagamentoPatrimonio;
  final RecebimentoPatrimonio recebimentopatrimonio;
  final Renda renda;
  final Recebimento recebimento;
  final Pagamento pagamento;
  final Patrimonio patrimonio;

  Params({
    this.tipoRenda,
    this.socioPatrimonio,
    this.pagination,
    this.contato,
    this.dependente,
    this.despesa,
    this.localizacao,
    this.midia,
    this.socio,
    this.movimentacao,
    this.municipio,
    this.pagador,
    this.pagamentoPatrimonio,
    this.recebimentopatrimonio,
    this.renda,
    this.recebimento,
    this.pagamento,
    this.patrimonio,
    this.tipoDespesa,
    this.tipoPatrimonio,
  });

  @override
  List<Object> get props => [
        contato,
        tipoRenda,
        socioPatrimonio,
        pagination,
        dependente,
        despesa,
        localizacao,
        midia,
        socio,
        movimentacao,
        municipio,
        pagador,
        pagamentoPatrimonio,
        recebimentopatrimonio,
        renda,
        recebimento,
        pagamento,
        patrimonio,
        tipoDespesa,
        tipoPatrimonio,
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
