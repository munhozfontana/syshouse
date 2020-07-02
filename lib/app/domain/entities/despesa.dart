import 'package:equatable/equatable.dart';

import 'patrimonio.dart';
import 'tipo_despesa.dart';

class Despesa extends Equatable {
  final String id;
  final String createdAt;
  final TipoDespesa tipoDespesa;
  final Patrimonio patrimonio;
  final String descricao;
  final double valor;
  final String vencimento;
  final String dataInicio;
  final String dataFim;
  final String obs;

  Despesa({
    this.id,
    this.createdAt,
    this.tipoDespesa,
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
