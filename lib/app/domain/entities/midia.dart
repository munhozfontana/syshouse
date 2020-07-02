import 'package:equatable/equatable.dart';

import 'patrimonio.dart';

class Midia extends Equatable {
  final String id;
  final String createdAt;
  final Patrimonio patrimonio;
  final String nome;
  final String caminho;
  final String obs;
  final String tipo;

  Midia({
    this.id,
    this.createdAt,
    this.patrimonio,
    this.nome,
    this.caminho,
    this.obs,
    this.tipo,
  });

  @override
  List<Object> get props => [id];
}
