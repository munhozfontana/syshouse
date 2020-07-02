import 'package:equatable/equatable.dart';

import 'patrimonio.dart';

class Movimentacao extends Equatable {
  final String id;
  final String createdAt;
  final Patrimonio patrimonioOut;
  final Patrimonio patrimonioIn;
  final double valor;
  final String data;
  final String obs;

  Movimentacao({
    this.id,
    this.createdAt,
    this.patrimonioOut,
    this.patrimonioIn,
    this.valor,
    this.data,
    this.obs,
  });

  @override
  List<Object> get props => [id];
}
