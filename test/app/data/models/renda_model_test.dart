import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/renda_model.dart';
import 'package:syshouse/app/domain/entities/renda.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tRendaModel = RendaModel(
    dataFim: "18/07/2020",
    dataInicio: "18/07/2020",
    descricao: "string",
    id: "6afd0d0c-bbe5-11ea-b3de-0242ac130004",
    obs: "string",
    pagadorId: "6afd096a-bbe5-11ea-b3de-0242ac130004",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    tipoRendaId: "6afcfec0-bbe5-11ea-b3de-0242ac130004",
    valor: 0,
    vencimento: "18/07/2020",
  );

  final apiJsonOk = json.decode(fixture('renda.json'));
  test('Sould be a subclass of RendaModel', () {
    expect(tRendaModel, isA<Renda>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = RendaModel.fromJson(apiJsonOk);

    expect(result, tRendaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tRendaModel.toJson();

    expect(result, apiJsonOk);
  });
}
