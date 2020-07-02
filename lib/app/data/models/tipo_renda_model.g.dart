// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_renda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoRendaModel _$TipoRendaModelFromJson(Map<String, dynamic> json) {
  return TipoRendaModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$TipoRendaModelToJson(TipoRendaModel instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'descricao': instance.descricao,
      'id': instance.id,
    };
