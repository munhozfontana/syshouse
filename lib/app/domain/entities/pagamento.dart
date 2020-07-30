import 'package:equatable/equatable.dart';

class Pagamento extends Equatable {
  final String id;
  final String createdAt;
  final String despesaId;
  final double valor;
  final String dataPagamento;
  final String obs;

  Pagamento({
    this.id,
    this.createdAt,
    this.despesaId,
    this.valor,
    this.dataPagamento,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
