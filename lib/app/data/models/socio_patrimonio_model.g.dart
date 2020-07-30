// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocioPatrimonioModel _$SocioPatrimonioModelFromJson(Map<String, dynamic> json) {
  return SocioPatrimonioModel(
    id: json['id'] as String,
    socioId: json['socioId'] as String,
    patrimonioId: json['patrimonioId'] as String,
    porcentagem: (json['porcentagem'] as num)?.toDouble(),
    proprietario: json['proprietario'] as bool,
  );
}

Map<String, dynamic> _$SocioPatrimonioModelToJson(
        SocioPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'socioId': instance.socioId,
      'patrimonioId': instance.patrimonioId,
      'porcentagem': instance.porcentagem,
      'proprietario': instance.proprietario,
    };
