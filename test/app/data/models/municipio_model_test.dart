import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/domain/entities/municipio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMunicipioModel = MunicipioModel(
    ibge: 0,
    id: "6afd005a-bbe5-11ea-b3de-0242ac130004",
    nome: "string",
    pais: "string",
    populacao: 0,
    uf: "uf",
  );

  final apiJsonOk = json.decode(fixture('municipio.json'));
  test('Sould be a subclass of MunicipioModel', () {
    expect(tMunicipioModel, isA<Municipio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = MunicipioModel.fromJson(apiJsonOk);

    expect(result, tMunicipioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tMunicipioModel.toJson();

    expect(result, apiJsonOk);
  });
}
