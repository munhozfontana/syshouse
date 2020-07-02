// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependente_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DependenteModel _$DependenteModelFromJson(Map<String, dynamic> json) {
  return DependenteModel(
    id: json['id'] as String,
    createdAt: json['createdAt'] as String,
    nome: json['nome'] as String,
    pagador: json['pagador'] == null
        ? null
        : PagadorModel.fromJson(json['pagador'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DependenteModelToJson(DependenteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'nome': instance.nome,
      'pagador': instance.pagador?.toJson(),
    };
