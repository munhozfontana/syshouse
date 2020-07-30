// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'socio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocioModel _$SocioModelFromJson(Map<String, dynamic> json) {
  return SocioModel(
    id: json['id'] as String,
    nome: json['nome'] as String,
    cpf: json['cpf'] as String,
    rg: json['rg'] as String,
    nacionalidade: json['nacionalidade'] as String,
    estadoCivil: json['estadoCivil'] as String,
    profissao: json['profissao'] as String,
  );
}

Map<String, dynamic> _$SocioModelToJson(SocioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'nacionalidade': instance.nacionalidade,
      'estadoCivil': instance.estadoCivil,
      'profissao': instance.profissao,
    };
