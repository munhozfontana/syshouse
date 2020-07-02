import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/tipo_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTipoPatrimonioModel = TipoPatrimonioModel(
      createdAt: "2020-06-26T13:50:51.784Z[UTC]",
      descricao: "string",
      id: "52811029-c813-4b9e-bda5-2b0be1047eaf");

  final apiJsonOk = json.decode(fixture('tipoPatrimonio.json'));
  test('Sould be a subclass of TipoPatrimonioModel', () {
    expect(tTipoPatrimonioModel, isA<TipoPatrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = TipoPatrimonioModel.fromJson(apiJsonOk);

    expect(result, tTipoPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tTipoPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
