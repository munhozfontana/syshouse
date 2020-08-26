import 'package:equatable/equatable.dart';

class PagamentoPatrimonio extends Equatable {
  final String id;

  final String pagamentoId;
  final String patrimonioId;
  final double valorCalculado;

  PagamentoPatrimonio({
    this.id,
    this.pagamentoId,
    this.patrimonioId,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
