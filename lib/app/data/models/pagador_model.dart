import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagador.dart';

part 'pagador_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagadorModel extends Pagador {
  PagadorModel({
    String id,
    String createdAt,
    String nome,
    String nascimento,
    String cpf,
    String rg,
    String cnpj,
    String nacionalidade,
    String estadoCivil,
    String profissao,
    String endereco,
  }) : super(
            id: id,
            createdAt: createdAt,
            nome: nome,
            nascimento: nascimento,
            cpf: cpf,
            rg: rg,
            cnpj: cnpj,
            nacionalidade: nacionalidade,
            estadoCivil: estadoCivil,
            profissao: profissao,
            endereco: endereco);

  factory PagadorModel.fromJson(Map<String, dynamic> json) =>
      _$PagadorModelFromJson(json);
  Map<String, dynamic> toJson() => _$PagadorModelToJson(this);
}
