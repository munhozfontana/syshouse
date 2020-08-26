import 'package:equatable/equatable.dart';

class RecebimentoPatrimonio extends Equatable {
  final String id;

  final String recebimentoId;
  final String patrimonioId;
  final double valorCalculado;

  RecebimentoPatrimonio({
    this.id,
    this.recebimentoId,
    this.patrimonioId,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
