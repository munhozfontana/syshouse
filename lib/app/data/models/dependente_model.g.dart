// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DependenteModel _$DependenteModelFromJson(Map<String, dynamic> json) {
  return DependenteModel(
    id: json['id'] as String,
    nome: json['nome'] as String,
    pagadorId: json['pagadorId'] as String,
  );
}

Map<String, dynamic> _$DependenteModelToJson(DependenteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pagadorId': instance.pagadorId,
      'nome': instance.nome,
    };
