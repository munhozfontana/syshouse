import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/socio.dart';

part 'socio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SocioModel extends Socio {
  SocioModel({
    String id,
    String nome,
    String cpf,
    String rg,
    String nacionalidade,
    String estadoCivil,
    String profissao,
  }) : super(
          id: id,
          nome: nome,
          cpf: cpf,
          rg: rg,
          nacionalidade: nacionalidade,
          estadoCivil: estadoCivil,
          profissao: profissao,
        );

  factory SocioModel.fromJson(Map<String, Object> json) =>
      _$SocioModelFromJson(json);
  Map<String, Object> toJson() => _$SocioModelToJson(this);
}
