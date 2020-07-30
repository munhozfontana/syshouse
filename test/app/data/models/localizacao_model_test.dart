import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/domain/entities/localizacao.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tLocalizacaoModel = LocalizacaoModel(
    bairro: "string",
    cep: "string",
    complemento: "string",
    endereco: "string",
    id: "6afd0154-bbe5-11ea-b3de-0242ac130004",
    latitude: 0,
    longitude: 0,
    municipioId: "6afd005a-bbe5-11ea-b3de-0242ac130004",
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
