import 'package:equatable/equatable.dart';

class Pagador extends Equatable {
  final String id;

  final String nome;
  final String nascimento;
  final String cpf;
  final String rg;
  final String cnpj;
  final String nacionalidade;
  final String estadoCivil;
  final String profissao;
  final String endereco;

  Pagador({
    this.id,
    this.nome,
    this.nascimento,
    this.cpf,
    this.rg,
    this.cnpj,
    this.nacionalidade,
    this.estadoCivil,
    this.profissao,
    this.endereco,
  });

  @override
  List<Object> get props => [id];
}
