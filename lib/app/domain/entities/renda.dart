import 'package:equatable/equatable.dart';

class Renda extends Equatable {
  final String id;

  final String pagadorId;
  final String tipoRendaId;
  final String patrimonioId;
  final String descricao;
  final double valor;
  final String vencimento;
  final String dataInicio;
  final String dataFim;
  final String obs;

  Renda({
    this.id,
    this.pagadorId,
    this.tipoRendaId,
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
