// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tipo_despesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TipoDespesaModel _$TipoDespesaModelFromJson(Map<String, dynamic> json) {
  return TipoDespesaModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$TipoDespesaModelToJson(TipoDespesaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'descricao': instance.descricao,
    };
