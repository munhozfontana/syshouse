// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localizacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalizacaoModel _$LocalizacaoModelFromJson(Map<String, dynamic> json) {
  return LocalizacaoModel(
    id: json['id'] as String,
    endereco: json['endereco'] as String,
    bairro: json['bairro'] as String,
    cep: json['cep'] as String,
    complemento: json['complemento'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    municipioId: json['municipioId'] as String,
  );
}

Map<String, dynamic> _$LocalizacaoModelToJson(LocalizacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'endereco': instance.endereco,
      'bairro': instance.bairro,
      'cep': instance.cep,
      'complemento': instance.complemento,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'municipioId': instance.municipioId,
    };
