import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/municipio.dart';

part 'municipio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MunicipioModel extends Municipio {
  MunicipioModel({
    String id,
    int ibge,
    String nome,
    String uf,
    String pais,
    int populacao,
  }) : super(
          id: id,
          ibge: ibge,
          nome: nome,
          uf: uf,
          pais: pais,
          populacao: populacao,
        );

  factory MunicipioModel.fromJson(Map<String, Object> json) =>
      _$MunicipioModelFromJson(json);
  Map<String, Object> toJson() => _$MunicipioModelToJson(this);
}
