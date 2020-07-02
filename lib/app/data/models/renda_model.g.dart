// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RendaModel _$RendaModelFromJson(Map<String, dynamic> json) {
  return RendaModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    pagador: json['pagador'] == null
        ? null
        : PagadorModel.fromJson(json['pagador'] as Map<String, dynamic>),
    tipoRenda: json['tipoRenda'] == null
        ? null
        : TipoRendaModel.fromJson(json['tipoRenda'] as Map<String, dynamic>),
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

Map<String, dynamic> _$RendaModelToJson(RendaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'descricao': instance.descricao,
      'valor': instance.valor,
      'vencimento': instance.vencimento,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'obs': instance.obs,
      'pagador': instance.pagador?.toJson(),
      'tipoRenda': instance.tipoRenda?.toJson(),
      'patrimonio': instance.patrimonio?.toJson(),
    };
