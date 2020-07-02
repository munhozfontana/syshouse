import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/municipio.dart';

part 'municipio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MunicipioModel extends Municipio {
  MunicipioModel({
    String id,
    String createdAt,
    int ibge,
    String nome,
    String uf,
    String pais,
    int populacao,
  }) : super(
          id: id,
          createdAt: createdAt,
          ibge: ibge,
          nome: nome,
          uf: uf,
          pais: pais,
          populacao: populacao,
        );

  factory MunicipioModel.fromJson(Map<String, dynamic> json) =>
      _$MunicipioModelFromJson(json);
  Map<String, dynamic> toJson() => _$MunicipioModelToJson(this);
}
