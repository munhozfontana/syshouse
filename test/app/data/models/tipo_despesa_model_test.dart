import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/domain/entities/tipo_despesa.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTipoDespesaModel = TipoDespesaModel(
    descricao: "string",
    id: "6afcf8d0-bbe5-11ea-b3de-0242ac130004",
  );

  final apiJsonOk = json.decode(fixture('tipo_despesa.json'));
  test('Sould be a subclass of TipoDespesaModel', () {
    expect(tTipoDespesaModel, isA<TipoDespesa>());
  });

  group('With Data', () {
    test('should return a valid model when the JSON is correct', () async {
      final result = TipoDespesaModel.fromJson(apiJsonOk);

      expect(result, tTipoDespesaModel);
    });

    test('should return a valid model to Json', () async {
      final result = tTipoDespesaModel.toJson();

      expect(result, apiJsonOk);
    });
  });
}
