// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecebimentoPatrimonioModel _$RecebimentoPatrimonioModelFromJson(
    Map<String, dynamic> json) {
  return RecebimentoPatrimonioModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    recebimento: json['recebimento'] == null
        ? null
        : RecebimentoModel.fromJson(
            json['recebimento'] as Map<String, dynamic>),
    patrimonio: json['patrimonio'] == null
        ? null
        : PatrimonioModel.fromJson(json['patrimonio'] as Map<String, dynamic>),
    valorCalculado: (json['valorCalculado'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RecebimentoPatrimonioModelToJson(
        RecebimentoPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'valorCalculado': instance.valorCalculado,
      'recebimento': instance.recebimento?.toJson(),
      'patrimonio': instance.patrimonio?.toJson(),
    };
