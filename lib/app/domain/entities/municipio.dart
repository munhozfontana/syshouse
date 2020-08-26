import 'package:equatable/equatable.dart';

class Municipio extends Equatable {
  final String id;

  final int ibge;
  final String nome;
  final String uf;
  final String pais;
  final int populacao;

  Municipio({
    this.id,
    this.ibge,
    this.nome,
    this.uf,
    this.pais,
    this.populacao,
  });

  @override
  List<Object> get props => [id];
}
