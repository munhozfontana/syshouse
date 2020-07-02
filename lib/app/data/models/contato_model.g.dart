// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContatoModel _$ContatoModelFromJson(Map<String, dynamic> json) {
  return ContatoModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    fone: json['fone'] as String,
    whatsapp: json['whatsapp'] as bool,
    email: json['email'] as String,
    pagador: json['pagador'] == null
        ? null
        : PagadorModel.fromJson(json['pagador'] as Map<String, dynamic>),
    socio: json['socio'] == null
        ? null
        : SocioModel.fromJson(json['socio'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContatoModelToJson(ContatoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'fone': instance.fone,
      'whatsapp': instance.whatsapp,
      'email': instance.email,
      'pagador': instance.pagador?.toJson(),
      'socio': instance.socio?.toJson(),
    };
