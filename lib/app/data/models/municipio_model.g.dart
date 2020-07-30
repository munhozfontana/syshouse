// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MunicipioModel _$MunicipioModelFromJson(Map<String, dynamic> json) {
  return MunicipioModel(
    id: json['id'] as String,
    ibge: json['ibge'] as int,
    nome: json['nome'] as String,
    uf: json['uf'] as String,
    pais: json['pais'] as String,
    populacao: json['populacao'] as int,
  );
}

Map<String, dynamic> _$MunicipioModelToJson(MunicipioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ibge': instance.ibge,
      'nome': instance.nome,
      'uf': instance.uf,
      'pais': instance.pais,
      'populacao': instance.populacao,
    };
