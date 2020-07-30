// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagamentoModel _$PagamentoModelFromJson(Map<String, dynamic> json) {
  return PagamentoModel(
    id: json['id'] as String,
    despesaId: json['despesaId'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    dataPagamento: json['dataPagamento'] as String,
    obs: json['obs'] as String,
  );
}

Map<String, dynamic> _$PagamentoModelToJson(PagamentoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'despesaId': instance.despesaId,
      'valor': instance.valor,
      'dataPagamento': instance.dataPagamento,
      'obs': instance.obs,
    };
