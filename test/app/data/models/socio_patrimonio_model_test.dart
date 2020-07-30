import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/socio_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tSocioPatrimonioModel = SocioPatrimonioModel(
    id: "6afd08a2-bbe5-11ea-b3de-0242ac130004",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    porcentagem: 0,
    proprietario: false,
    socioId: "6afd07da-bbe5-11ea-b3de-0242ac130004",
  );

  final apiJsonOk = json.decode(fixture('socioPatrimonio.json'));
  test('Sould be a subclass of SocioPatrimonioModel', () {
    expect(tSocioPatrimonioModel, isA<SocioPatrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = SocioPatrimonioModel.fromJson(apiJsonOk);

    expect(result, tSocioPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tSocioPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
