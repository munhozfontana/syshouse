import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/movimentacao_model.dart';
import 'package:syshouse/app/domain/entities/movimentacao.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMovimentacaoModel = MovimentacaoModel(
    data: "18/07/2020",
    id: "6afd0640-bbe5-11ea-b3de-0242ac130004",
    obs: "string",
    patrimonioIn: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
    patrimonioOut: "6afd0578-bbe5-11ea-b3de-0242ac130004",
    valor: 0,
  );

  final apiJsonOk = json.decode(fixture('movimentacao.json'));
  test('Sould be a subclass of MovimentacaoModel', () {
    expect(tMovimentacaoModel, isA<Movimentacao>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = MovimentacaoModel.fromJson(apiJsonOk);

    expect(result, tMovimentacaoModel);
  });

  test('should return a valid model to Json', () async {
    final result = tMovimentacaoModel.toJson();

    expect(result, apiJsonOk);
  });
}
