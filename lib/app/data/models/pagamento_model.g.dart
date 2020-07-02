// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagamentoModel _$PagamentoModelFromJson(Map<String, dynamic> json) {
  return PagamentoModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    despesa: json['despesa'] == null
        ? null
        : DespesaModel.fromJson(json['despesa'] as Map<String, dynamic>),
    valor: (json['valor'] as num)?.toDouble(),
    dataPagamento: json['dataPagamento'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$PagamentoModelToJson(PagamentoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'valor': instance.valor,
      'dataPagamento': instance.dataPagamento,
      'obs': instance.obs,
      'despesa': instance.despesa?.toJson(),
    };
