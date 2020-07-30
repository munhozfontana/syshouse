import 'package:equatable/equatable.dart';

class PagamentoPatrimonio extends Equatable {
  final String id;
  final String createdAt;
  final String pagamentoId;
  final String patrimonioId;
  final double valorCalculado;

  PagamentoPatrimonio({
    this.id,
    this.createdAt,
    this.pagamentoId,
    this.patrimonioId,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
