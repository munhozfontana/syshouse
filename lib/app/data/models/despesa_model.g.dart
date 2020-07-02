// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'despesa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DespesaModel _$DespesaModelFromJson(Map<String, dynamic> json) {
  return DespesaModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    tipoDespesa: json['tipoDespesa'] == null
        ? null
        : TipoDespesaModel.fromJson(
            json['tipoDespesa'] as Map<String, dynamic>),
    patrimonio: json['patrimonio'] == null
        ? null
        : PatrimonioModel.fromJson(json['patrimonio'] as Map<String, dynamic>),
    descricao: json['descricao'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    vencimento: json['vencimento'] as String,
    dataInicio: json['dataInicio'] as String,
    dataFim: json['dataFim'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$DespesaModelToJson(DespesaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'descricao': instance.descricao,
      'valor': instance.valor,
      'vencimento': instance.vencimento,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'obs': instance.obs,
      'tipoDespesa': instance.tipoDespesa?.toJson(),
      'patrimonio': instance.patrimonio?.toJson(),
    };
