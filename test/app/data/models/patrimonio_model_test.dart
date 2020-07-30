import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPatrimonioModel = PatrimonioModel(
    dataFim: "30/07/2020",
    dataInicio: "30/07/2020",
    id: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    localizacaoId: "6afd0154-bbe5-11ea-b3de-0242ac130004",
    nome: "string",
    tipoPatrimonioId: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
    valor: 0,
  );

  final apiJsonOk = json.decode(fixture('patrimonio.json'));
  test('Sould be a subclass of PatrimonioModel', () {
    expect(tPatrimonioModel, isA<Patrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = PatrimonioModel.fromJson(apiJsonOk);

    expect(result, tPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
