// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movimentacao_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovimentacaoModel _$MovimentacaoModelFromJson(Map<String, dynamic> json) {
  return MovimentacaoModel(
    id: json['id'] as String,
    patrimonioIn: json['patrimonioIn'] as String,
    patrimonioOut: json['patrimonioOut'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    data: json['data'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$MovimentacaoModelToJson(MovimentacaoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patrimonioOut': instance.patrimonioOut,
      'patrimonioIn': instance.patrimonioIn,
      'valor': instance.valor,
      'data': instance.data,
      'obs': instance.obs,
    };
