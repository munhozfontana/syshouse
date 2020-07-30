import 'package:equatable/equatable.dart';

class Movimentacao extends Equatable {
  final String id;
  final String createdAt;
  final String patrimonioOut;
  final String patrimonioIn;
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
