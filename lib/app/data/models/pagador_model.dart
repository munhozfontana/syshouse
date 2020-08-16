import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagador.dart';

part 'pagador_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagadorModel extends Pagador {
  PagadorModel({
    String id,
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
            nome: nome,
            nascimento: nascimento,
            cpf: cpf,
            rg: rg,
            cnpj: cnpj,
            nacionalidade: nacionalidade,
            estadoCivil: estadoCivil,
            profissao: profissao,
            endereco: endereco);

  factory PagadorModel.fromJson(Map<String, Object> json) =>
      _$PagadorModelFromJson(json);
  Map<String, Object> toJson() => _$PagadorModelToJson(this);
}
