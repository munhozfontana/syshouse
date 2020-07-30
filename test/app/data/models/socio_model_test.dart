import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/domain/entities/socio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tSocioModel = SocioModel(
    cpf: "string",
    estadoCivil: "string",
    id: "6afd07da-bbe5-11ea-b3de-0242ac130004",
    nacionalidade: "string",
    nome: "string",
    profissao: "string",
    rg: "string",
  );

  final apiJsonOk = json.decode(fixture('socio.json'));
  test('Sould be a subclass of SocioModel', () {
    expect(tSocioModel, isA<Socio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = SocioModel.fromJson(apiJsonOk);

    expect(result, tSocioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tSocioModel.toJson();

    expect(result, apiJsonOk);
  });
}
