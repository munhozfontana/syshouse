import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/localizacao.dart';

part 'localizacao_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LocalizacaoModel extends Localizacao {
  LocalizacaoModel(
      {String id,
      String endereco,
      String bairro,
      String cep,
      String complemento,
      double latitude,
      double longitude,
      String municipioId})
      : super(
            id: id,
            endereco: endereco,
            bairro: bairro,
            cep: cep,
            complemento: complemento,
            latitude: latitude,
            longitude: longitude,
            municipioId: municipioId);

  factory LocalizacaoModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizacaoModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocalizacaoModelToJson(this);
}
