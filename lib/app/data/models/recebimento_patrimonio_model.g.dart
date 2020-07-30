// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recebimento_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecebimentoPatrimonioModel _$RecebimentoPatrimonioModelFromJson(
    Map<String, dynamic> json) {
  return RecebimentoPatrimonioModel(
    id: json['id'] as String,
    recebimentoId: json['recebimentoId'] as String,
    patrimonioId: json['patrimonioId'] as String,
    valorCalculado: (json['valorCalculado'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RecebimentoPatrimonioModelToJson(
        RecebimentoPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recebimentoId': instance.recebimentoId,
      'patrimonioId': instance.patrimonioId,
      'valorCalculado': instance.valorCalculado,
    };
