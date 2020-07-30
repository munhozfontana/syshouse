// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagamentoPatrimonioModel _$PagamentoPatrimonioModelFromJson(
    Map<String, dynamic> json) {
  return PagamentoPatrimonioModel(
    id: json['id'] as String,
    pagamentoId: json['pagamentoId'] as String,
    patrimonioId: json['patrimonioId'] as String,
    valorCalculado: (json['valorCalculado'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PagamentoPatrimonioModelToJson(
        PagamentoPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pagamentoId': instance.pagamentoId,
      'patrimonioId': instance.patrimonioId,
      'valorCalculado': instance.valorCalculado,
    };
