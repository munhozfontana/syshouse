// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_renda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoRendaModel _$TipoRendaModelFromJson(Map<String, dynamic> json) {
  return TipoRendaModel(
    id: json['id'] as String,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$TipoRendaModelToJson(TipoRendaModel instance) =>
    <String, dynamic>{
      'descricao': instance.descricao,
      'id': instance.id,
    };
