import 'package:equatable/equatable.dart';

class Patrimonio extends Equatable {
  final String id;
  final String createdAt;
  final String nome;
  final double valor;
  final String dataInicio;
  final String dataFim;
  final String tipoPatrimonioId;
  final String localizacaoId;

  Patrimonio({
    this.id,
    this.createdAt,
    this.nome,
    this.valor,
    this.dataInicio,
    this.dataFim,
    this.tipoPatrimonioId,
    this.localizacaoId,
  });

  @override
  List<Object> get props => [id];
}
