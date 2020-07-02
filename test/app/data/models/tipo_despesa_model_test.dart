import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/domain/entities/tipo_despesa.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTipoDespesaModel = TipoDespesaModel(
      createdAt: "2020-06-26T13:50:51.784Z[UTC]",
      descricao: "string",
      id: "52811029-c813-4b9e-bda5-2b0be1047eaf");

  final apiJsonOk = json.decode(fixture('tipoDespesa.json'));
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
