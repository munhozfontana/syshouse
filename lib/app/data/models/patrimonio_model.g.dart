// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatrimonioModel _$PatrimonioModelFromJson(Map<String, dynamic> json) {
  return PatrimonioModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    nome: json['nome'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    dataInicio: json['dataInicio'] as String,
    dataFim: json['dataFim'] as String,
    tipoPatrimonio: json['tipoPatrimonio'] == null
        ? null
        : TipoPatrimonioModel.fromJson(
            json['tipoPatrimonio'] as Map<String, dynamic>),
    localizacao: json['localizacao'] == null
        ? null
        : LocalizacaoModel.fromJson(
            json['localizacao'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PatrimonioModelToJson(PatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'nome': instance.nome,
      'valor': instance.valor,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'tipoPatrimonio': instance.tipoPatrimonio?.toJson(),
      'localizacao': instance.localizacao?.toJson(),
    };
