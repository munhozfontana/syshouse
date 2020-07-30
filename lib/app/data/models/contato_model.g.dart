// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoModel _$ContatoModelFromJson(Map<String, dynamic> json) {
  return ContatoModel(
    id: json['id'] as String,
    fone: json['fone'] as String,
    whatsapp: json['whatsapp'] as bool,
    email: json['email'] as String,
    pagadorId: json['pagadorId'] as String,
    socioId: json['socioId'] as String,
  );
}

Map<String, dynamic> _$ContatoModelToJson(ContatoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fone': instance.fone,
      'whatsapp': instance.whatsapp,
      'email': instance.email,
      'pagadorId': instance.pagadorId,
      'socioId': instance.socioId,
    };
