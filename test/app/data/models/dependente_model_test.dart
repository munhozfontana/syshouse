import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/dependente_model.dart';
import 'package:syshouse/app/domain/entities/dependente.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tDependenteModel = DependenteModel(
    id: "6afd0c3a-bbe5-11ea-b3de-0242ac130004",
    nome: "string",
    pagadorId: "6afd096a-bbe5-11ea-b3de-0242ac130004",
  );

  final apiJsonOk = json.decode(fixture('dependente.json'));
  test('Sould be a subclass of DependenteModel', () {
    expect(tDependenteModel, isA<Dependente>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = DependenteModel.fromJson(apiJsonOk);

    expect(result, tDependenteModel);
  });

  test('should return a valid model to Json', () async {
    final result = tDependenteModel.toJson();

    expect(result, apiJsonOk);
  });
}
