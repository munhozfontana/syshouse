// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidiaModel _$MidiaModelFromJson(Map<String, dynamic> json) {
  return MidiaModel(
    id: json['id'] as String,
    patrimonioId: json['patrimonioId'] as String,
    nome: json['nome'] as String,
    caminho: json['caminho'] as String,
    obs: json['obs'] as String,
    tipo: json['tipo'] as String,
  );
}

Map<String, dynamic> _$MidiaModelToJson(MidiaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patrimonioId': instance.patrimonioId,
      'nome': instance.nome,
      'caminho': instance.caminho,
      'obs': instance.obs,
      'tipo': instance.tipo,
    };
