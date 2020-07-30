// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagador_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagadorModel _$PagadorModelFromJson(Map<String, dynamic> json) {
  return PagadorModel(
    id: json['id'] as String,
    nome: json['nome'] as String,
    nascimento: json['nascimento'] as String,
    cpf: json['cpf'] as String,
    rg: json['rg'] as String,
    cnpj: json['cnpj'] as String,
    nacionalidade: json['nacionalidade'] as String,
    estadoCivil: json['estadoCivil'] as String,
    profissao: json['profissao'] as String,
    endereco: json['endereco'] as String,
  );
}

Map<String, dynamic> _$PagadorModelToJson(PagadorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'nascimento': instance.nascimento,
      'cpf': instance.cpf,
      'rg': instance.rg,
      'cnpj': instance.cnpj,
      'nacionalidade': instance.nacionalidade,
      'estadoCivil': instance.estadoCivil,
      'profissao': instance.profissao,
      'endereco': instance.endereco,
    };
