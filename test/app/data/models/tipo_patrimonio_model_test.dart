import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/tipo_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tTipoPatrimonioModel = TipoPatrimonioModel(
    descricao: "string",
    id: "6afcf8d0-bbe5-11ea-b3de-0242ac130004",
  );

  final apiJsonOk = json.decode(fixture('tipo_patrimonio.json'));
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
