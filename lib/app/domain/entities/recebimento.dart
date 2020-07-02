import 'package:equatable/equatable.dart';

import 'renda.dart';

class Recebimento extends Equatable {
  final String id;
  final String createdAt;
  final Renda renda;
  final double valor;
  final String dataRecebimento;
  final String obs;

  Recebimento({
    this.id,
    this.createdAt,
    this.renda,
    this.valor,
    this.dataRecebimento,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
