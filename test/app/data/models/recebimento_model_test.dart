import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/recebimento_model.dart';
import 'package:syshouse/app/domain/entities/recebimento.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tRecebimentoModel = RecebimentoModel(
    dataRecebimento: "18/07/2020",
    id: "6afd0dd4-bbe5-11ea-b3de-0242ac130004",
    obs: "string",
    rendaId: "6afd0d0c-bbe5-11ea-b3de-0242ac130004",
    valor: 0,
  );

  final apiJsonOk = json.decode(fixture('recebimento.json'));
  test('Sould be a subclass of RecebimentoModel', () {
    expect(tRecebimentoModel, isA<Recebimento>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = RecebimentoModel.fromJson(apiJsonOk);

    expect(result, tRecebimentoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tRecebimentoModel.toJson();

    expect(result, apiJsonOk);
  });
}
