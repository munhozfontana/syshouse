import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/domain/entities/tipo_renda.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTipoRendaModel = TipoRendaModel(
      createdAt: "2020-06-26T13:50:51.784Z[UTC]",
      descricao: "string",
      id: "52811029-c813-4b9e-bda5-2b0be1047eaf");

  final apiJsonOk = json.decode(fixture('tipoRenda.json'));
  test('Sould be a subclass of TipoRendaModel', () {
    expect(tTipoRendaModel, isA<TipoRenda>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = TipoRendaModel.fromJson(apiJsonOk);

    expect(result, tTipoRendaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tTipoRendaModel.toJson();

    expect(result, apiJsonOk);
  });
}
