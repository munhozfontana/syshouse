import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/domain/entities/municipio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMunicipioModel = MunicipioModel(
    createdAt: "2020-06-26T17:24:41.659Z[UTC]",
    ibge: 0,
    id: "f95d193d-7040-4d67-ae3b-a09bb12134ed",
    nome: "string",
    pais: "string",
    populacao: 0,
    uf: "string",
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
