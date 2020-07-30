import 'package:equatable/equatable.dart';

class RecebimentoPatrimonio extends Equatable {
  final String id;
  final String createdAt;
  final String recebimentoId;
  final String patrimonioId;
  final double valorCalculado;

  RecebimentoPatrimonio({
    this.id,
    this.createdAt,
    this.recebimentoId,
    this.patrimonioId,
    this.valorCalculado,
  });

  @override
  List<Object> get props => [id];
}
