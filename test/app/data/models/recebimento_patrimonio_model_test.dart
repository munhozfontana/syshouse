import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/recebimento_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/recebimento_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tRecebimentoPatrimonioModel = RecebimentoPatrimonioModel(
    id: "6afd0e9c-bbe5-11ea-b3de-0242ac130004",
    patrimonioId: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    recebimentoId: "6afd0dd4-bbe5-11ea-b3de-0242ac130004",
    valorCalculado: 0,
  );

  final apiJsonOk = json.decode(fixture('recebimentoPatrimonio.json'));
  test('Sould be a subclass of RecebimentoPatrimonioModel', () {
    expect(tRecebimentoPatrimonioModel, isA<RecebimentoPatrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = RecebimentoPatrimonioModel.fromJson(apiJsonOk);

    expect(result, tRecebimentoPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tRecebimentoPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
