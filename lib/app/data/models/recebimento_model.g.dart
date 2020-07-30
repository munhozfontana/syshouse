// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecebimentoModel _$RecebimentoModelFromJson(Map<String, dynamic> json) {
  return RecebimentoModel(
    id: json['id'] as String,
    rendaId: json['rendaId'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    dataRecebimento: json['dataRecebimento'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$RecebimentoModelToJson(RecebimentoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rendaId': instance.rendaId,
      'valor': instance.valor,
      'dataRecebimento': instance.dataRecebimento,
      'obs': instance.obs,
    };
