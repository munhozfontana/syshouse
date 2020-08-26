import 'package:equatable/equatable.dart';

class Socio extends Equatable {
  final String id;

  final String nome;
  final String cpf;
  final String rg;
  final String nacionalidade;
  final String estadoCivil;
  final String profissao;

  Socio({
    this.id,
    this.nome,
    this.cpf,
    this.rg,
    this.nacionalidade,
    this.estadoCivil,
    this.profissao,
  });

  @override
  List<Object> get props => [id];
}
