import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/localizacao.dart';
import 'municipio_model.dart';

part 'localizacao_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalizacaoModel extends Localizacao {
  final MunicipioModel municipio;

  LocalizacaoModel(
      {String id,
      String createdAt,
      String endereco,
      String bairro,
      String cep,
      String complemento,
      double latitude,
      double longitude,
      this.municipio})
      : super(
            id: id,
            createdAt: createdAt,
            endereco: endereco,
            bairro: bairro,
            cep: cep,
            complemento: complemento,
            latitude: latitude,
            longitude: longitude,
            municipio: municipio);

  factory LocalizacaoModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizacaoModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalizacaoModelToJson(this);
}
