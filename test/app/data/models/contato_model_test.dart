import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/contato_model.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/domain/entities/contato.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tContatoModel = ContatoModel(
      createdAt: "2020-07-01T22:05:29.764Z[UTC]",
      email: "string",
      fone: "string",
      id: "6afd0b68-bbe5-11ea-b3de-0242ac130004",
      pagador: PagadorModel(
          cnpj: "string",
          cpf: "string",
          createdAt: "2020-07-01T22:05:29.761Z[UTC]",
          endereco: "string",
          estadoCivil: "string",
          id: "6afd096a-bbe5-11ea-b3de-0242ac130004",
          nacionalidade: "string",
          nascimento: "01/07/2020",
          nome: "string",
          profissao: "string",
          rg: "string"),
      socio: SocioModel(
          cpf: "string",
          createdAt: "2020-07-01T22:05:29.749Z[UTC]",
          estadoCivil: "string",
          id: "6afd07da-bbe5-11ea-b3de-0242ac130004",
          nacionalidade: "string",
          nome: "string",
          profissao: "string",
          rg: "string"),
      whatsapp: false);

  final apiJsonOk = json.decode(fixture('contato.json'));
  test('Sould be a subclass of ContatoModel', () {
    expect(tContatoModel, isA<Contato>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = ContatoModel.fromJson(apiJsonOk);

    expect(result, tContatoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tContatoModel.toJson();

    expect(result, apiJsonOk);
  });
}
