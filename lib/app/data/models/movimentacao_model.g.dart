// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimentacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovimentacaoModel _$MovimentacaoModelFromJson(Map<String, dynamic> json) {
  return MovimentacaoModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    patrimonioIn: json['patrimonioIn'] == null
        ? null
        : PatrimonioModel.fromJson(
            json['patrimonioIn'] as Map<String, dynamic>),
    patrimonioOut: json['patrimonioOut'] == null
        ? null
        : PatrimonioModel.fromJson(
            json['patrimonioOut'] as Map<String, dynamic>),
    valor: (json['valor'] as num)?.toDouble(),
    data: json['data'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$MovimentacaoModelToJson(MovimentacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'valor': instance.valor,
      'data': instance.data,
      'obs': instance.obs,
      'patrimonioIn': instance.patrimonioIn?.toJson(),
      'patrimonioOut': instance.patrimonioOut?.toJson(),
    };
