import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/contato_model.dart';
import 'package:syshouse/app/domain/entities/contato.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tContatoModel = ContatoModel(
    email: "string",
    fone: "string",
    id: "0151cfe8-63d8-424f-ab6f-a84e2c87e7ea",
    pagadorId: "6afd096a-bbe5-11ea-b3de-0242ac130004",
    socioId: "6afd07da-bbe5-11ea-b3de-0242ac130004",
    whatsapp: true,
  );

  final apiJsonOk = json.decode(fixture('contato.json'));
  test('Sould be a subclass of ContatoModel', () {
    expect(tContatoModel, isA<Contato>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = ContatoModel.fromJson(apiJsonOk);

    expect(result, tContatoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tContatoModel.toJson();

    expect(result, apiJsonOk);
  });
}
