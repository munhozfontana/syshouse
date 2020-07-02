// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagamento_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagamentoPatrimonioModel _$PagamentoPatrimonioModelFromJson(
    Map<String, dynamic> json) {
  return PagamentoPatrimonioModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    pagamento: json['pagamento'] == null
        ? null
        : PagamentoModel.fromJson(json['pagamento'] as Map<String, dynamic>),
    patrimonio: json['patrimonio'] == null
        ? null
        : PatrimonioModel.fromJson(json['patrimonio'] as Map<String, dynamic>),
    valorCalculado: (json['valorCalculado'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PagamentoPatrimonioModelToJson(
        PagamentoPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'valorCalculado': instance.valorCalculado,
      'pagamento': instance.pagamento?.toJson(),
      'patrimonio': instance.patrimonio?.toJson(),
    };
