import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/pagamento_model.dart';
import 'package:syshouse/app/domain/entities/pagamento.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPagamentoModel = PagamentoModel(
    dataPagamento: "30/07/2020",
    despesaId: "6afd1d24-bbe5-11ea-b3de-0242ac130004",
    id: "6afd206c-bbe5-11ea-b3de-0242ac130004",
    obs: "string",
    valor: 0,
  );

  final apiJsonOk = json.decode(fixture('pagamento.json'));
  test('Sould be a subclass of PagamentoModel', () {
    expect(tPagamentoModel, isA<Pagamento>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = PagamentoModel.fromJson(apiJsonOk);

    expect(result, tPagamentoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tPagamentoModel.toJson();

    expect(result, apiJsonOk);
  });
}
