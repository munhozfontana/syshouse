// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoPatrimonioModel _$TipoPatrimonioModelFromJson(Map<String, dynamic> json) {
  return TipoPatrimonioModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$TipoPatrimonioModelToJson(
        TipoPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'descricao': instance.descricao,
    };
