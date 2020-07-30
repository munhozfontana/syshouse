import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/midia_model.dart';
import 'package:syshouse/app/domain/entities/midia.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMidiaModel = MidiaModel(
    caminho: "string",
    id: "6afd0708-bbe5-11ea-b3de-0242ac130004",
    nome: "string",
    obs: "string",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    tipo: "string",
  );

  final apiJsonOk = json.decode(fixture('midia.json'));
  test('Sould be a subclass of MidiaModel', () {
    expect(tMidiaModel, isA<Midia>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = MidiaModel.fromJson(apiJsonOk);

    expect(result, tMidiaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tMidiaModel.toJson();

    expect(result, apiJsonOk);
  });
}
