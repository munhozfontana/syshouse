// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RendaModel _$RendaModelFromJson(Map<String, dynamic> json) {
  return RendaModel(
    id: json['id'] as String,
    pagadorId: json['pagadorId'] as String,
    tipoRendaId: json['tipoRendaId'] as String,
    patrimonioId: json['patrimonioId'] as String,
    descricao: json['descricao'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    vencimento: json['vencimento'] as String,
    dataInicio: json['dataInicio'] as String,
    dataFim: json['dataFim'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$RendaModelToJson(RendaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pagadorId': instance.pagadorId,
      'tipoRendaId': instance.tipoRendaId,
      'patrimonioId': instance.patrimonioId,
      'descricao': instance.descricao,
      'valor': instance.valor,
      'vencimento': instance.vencimento,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'obs': instance.obs,
    };
