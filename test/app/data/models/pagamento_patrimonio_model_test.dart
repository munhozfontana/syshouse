import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/pagamento_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPagamentoPatrimonioModel = PagamentoPatrimonioModel(
    id: "6afd2166-bbe5-11ea-b3de-0242ac130004",
    pagamentoId: "6afd206c-bbe5-11ea-b3de-0242ac130004",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    valorCalculado: 0,
  );

  final apiJsonOk = json.decode(fixture('pagamentoPatrimonio.json'));
  test('Sould be a subclass of PagamentoPatrimonioModel', () {
    expect(tPagamentoPatrimonioModel, isA<PagamentoPatrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = PagamentoPatrimonioModel.fromJson(apiJsonOk);

    expect(result, tPagamentoPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tPagamentoPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
