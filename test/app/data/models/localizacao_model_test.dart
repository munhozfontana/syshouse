import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/domain/entities/localizacao.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tLocalizacaoModel = LocalizacaoModel(
    bairro: "string",
    cep: "string",
    complemento: "string",
    createdAt: "2020-07-01T22:05:29.716Z[UTC]",
    endereco: "string",
    id: "6afd0154-bbe5-11ea-b3de-0242ac130004",
    latitude: 0,
    longitude: 0,
    municipio: MunicipioModel(
        createdAt: "2020-07-01T22:05:29.714Z[UTC]",
        ibge: 0,
        id: "6afd005a-bbe5-11ea-b3de-0242ac130004",
        nome: "string",
        pais: "string",
        populacao: 0,
        uf: "uf"),
  );

  final apiJsonOk = json.decode(fixture('localizacao.json'));
  test('Sould be a subclass of LocalizacaoModel', () {
    expect(tLocalizacaoModel, isA<Localizacao>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = LocalizacaoModel.fromJson(apiJsonOk);

    expect(result, tLocalizacaoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tLocalizacaoModel.toJson();

    expect(result, apiJsonOk);
  });
}
