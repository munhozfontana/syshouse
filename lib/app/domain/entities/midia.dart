import 'package:equatable/equatable.dart';

class Midia extends Equatable {
  final String id;
  final String createdAt;
  final String patrimonioId;
  final String nome;
  final String caminho;
  final String obs;
  final String tipo;

  Midia({
    this.id,
    this.createdAt,
    this.patrimonioId,
    this.nome,
    this.caminho,
    this.obs,
    this.tipo,
  });

  @override
  List<Object> get props => [id];
}
