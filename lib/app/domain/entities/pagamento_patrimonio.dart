import 'package:equatable/equatable.dart';

import 'pagamento.dart';
import 'patrimonio.dart';

class PagamentoPatrimonio extends Equatable {
  final String id;
  final String createdAt;
  final Pagamento pagamento;
  final Patrimonio patrimonio;
  final double valorCalculado;

  PagamentoPatrimonio({
    this.id,
    this.createdAt,
    this.pagamento,
    this.patrimonio,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
