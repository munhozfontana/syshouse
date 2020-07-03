// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocioPatrimonioModel _$SocioPatrimonioModelFromJson(Map<String, dynamic> json) {
  return SocioPatrimonioModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    socio: json['socio'] == null
        ? null
        : SocioModel.fromJson(json['socio'] as Map<String, dynamic>),
    patrimonio: json['patrimonio'] == null
        ? null
        : PatrimonioModel.fromJson(json['patrimonio'] as Map<String, dynamic>),
    porcentagem: (json['porcentagem'] as num)?.toDouble(),
    proprietario: json['proprietario'] as bool,
  );
}

Map<String, dynamic> _$SocioPatrimonioModelToJson(
        SocioPatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'porcentagem': instance.porcentagem,
      'proprietario': instance.proprietario,
      'socio': instance.socio?.toJson(),
      'patrimonio': instance.patrimonio?.toJson(),
    };
