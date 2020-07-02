import 'package:equatable/equatable.dart';

import 'pagador.dart';
import 'patrimonio.dart';
import 'tipo_renda.dart';

class Renda extends Equatable {
  final String id;
  final String createdAt;
  final Pagador pagador;
  final TipoRenda tipoRenda;
  final Patrimonio patrimonio;
  final String descricao;
  final double valor;
  final String vencimento;
  final String dataInicio;
  final String dataFim;
  final String obs;

  Renda({
    this.id,
    this.createdAt,
    this.pagador,
    this.tipoRenda,
    this.patrimonio,
    this.descricao,
    this.valor,
    this.vencimento,
    this.dataInicio,
    this.dataFim,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
