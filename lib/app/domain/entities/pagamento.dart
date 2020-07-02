import 'package:equatable/equatable.dart';

import 'despesa.dart';

class Pagamento extends Equatable {
  final String id;
  final String createdAt;
  final Despesa despesa;
  final double valor;
  final String dataPagamento;
  final String obs;

  Pagamento({
    this.id,
    this.createdAt,
    this.despesa,
    this.valor,
    this.dataPagamento,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
