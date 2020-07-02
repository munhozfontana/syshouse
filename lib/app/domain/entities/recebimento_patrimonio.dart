import 'package:equatable/equatable.dart';

import 'patrimonio.dart';
import 'recebimento.dart';

class RecebimentoPatrimonio extends Equatable {
  final String id;
  final String createdAt;
  final Recebimento recebimento;
  final Patrimonio patrimonio;
  final double valorCalculado;

  RecebimentoPatrimonio({
    this.id,
    this.createdAt,
    this.recebimento,
    this.patrimonio,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
