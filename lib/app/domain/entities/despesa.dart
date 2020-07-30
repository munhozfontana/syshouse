import 'package:equatable/equatable.dart';

class Despesa extends Equatable {
  final String id;
  final String createdAt;
  final String tipoDespesaId;
  final String patrimonioId;
  final String descricao;
  final double valor;
  final String vencimento;
  final String dataInicio;
  final String dataFim;
  final String obs;

  Despesa({
    this.id,
    this.createdAt,
    this.tipoDespesaId,
    this.patrimonioId,
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
