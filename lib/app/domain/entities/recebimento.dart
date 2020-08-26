import 'package:equatable/equatable.dart';

class Recebimento extends Equatable {
  final String id;

  final String rendaId;
  final double valor;
  final String dataRecebimento;
  final String obs;

  Recebimento({
    this.id,
    this.rendaId,
    this.valor,
    this.dataRecebimento,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
