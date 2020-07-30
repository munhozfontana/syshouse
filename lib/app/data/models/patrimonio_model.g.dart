// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patrimonio_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatrimonioModel _$PatrimonioModelFromJson(Map<String, dynamic> json) {
  return PatrimonioModel(
    id: json['id'] as String,
    nome: json['nome'] as String,
    valor: (json['valor'] as num)?.toDouble(),
    dataInicio: json['dataInicio'] as String,
    dataFim: json['dataFim'] as String,
    tipoPatrimonioId: json['tipoPatrimonioId'] as String,
    localizacaoId: json['localizacaoId'] as String,
  );
}

Map<String, dynamic> _$PatrimonioModelToJson(PatrimonioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'valor': instance.valor,
      'dataInicio': instance.dataInicio,
      'dataFim': instance.dataFim,
      'tipoPatrimonioId': instance.tipoPatrimonioId,
      'localizacaoId': instance.localizacaoId,
    };
