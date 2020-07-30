import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/domain/entities/pagador.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPagadorModel = PagadorModel(
    cnpj: "string",
    cpf: "string",
    endereco: "string",
    estadoCivil: "string",
    id: "6afd096a-bbe5-11ea-b3de-0242ac130004",
    nacionalidade: "string",
    nascimento: "18/07/2020",
    nome: "string",
    profissao: "string",
    rg: "string",
  );

  final apiJsonOk = json.decode(fixture('pagador.json'));
  test('Sould be a subclass of PagadorModel', () {
    expect(tPagadorModel, isA<Pagador>());
  });

  group('With Data', () {
    test('should return a valid model when the JSON is correct', () async {
      final result = PagadorModel.fromJson(apiJsonOk);

      expect(result, tPagadorModel);
    });

    test('should return a valid model to Json', () async {
      final result = tPagadorModel.toJson();

      expect(result, apiJsonOk);
    });
  });
}
