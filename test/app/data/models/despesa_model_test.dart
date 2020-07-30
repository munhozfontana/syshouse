import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/despesa_model.dart';
import 'package:syshouse/app/domain/entities/despesa.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tDespesaModel = DespesaModel(
    dataFim: "18/07/2020",
    dataInicio: "18/07/2020",
    descricao: "string",
    id: "6afd1d24-bbe5-11ea-b3de-0242ac130004",
    obs: "string",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    tipoDespesaId: "6afcf8d0-bbe5-11ea-b3de-0242ac130004",
    valor: 0,
    vencimento: "18/07/2020",
  );

  final apiJsonOk = json.decode(fixture('despesa.json'));
  test('Sould be a subclass of DespesaModel', () {
    expect(tDespesaModel, isA<Despesa>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = DespesaModel.fromJson(apiJsonOk);

    expect(result, tDespesaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tDespesaModel.toJson();

    expect(result, apiJsonOk);
  });
}
