import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/movimentacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/movimentacao.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMovimentacaoModel = MovimentacaoModel(
      createdAt: "2020-07-01T23:18:06.088Z[UTC]",
      data: "01/07/2020",
      id: "6afd0640-bbe5-11ea-b3de-0242ac130004",
      obs: "string",
      patrimonioIn: PatrimonioModel(
        createdAt: "2020-07-01T23:18:06.077Z[UTC]",
        dataFim: "01/07/2020",
        dataInicio: "01/07/2020",
        id: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
        localizacao: LocalizacaoModel(
          bairro: "string",
          cep: "string",
          complemento: "string",
          createdAt: "2020-07-01T23:18:06.07Z[UTC]",
          endereco: "string",
          id: "6afd0154-bbe5-11ea-b3de-0242ac130004",
          latitude: 0,
          longitude: 0,
          municipio: MunicipioModel(
              createdAt: "2020-07-01T23:18:06.063Z[UTC]",
              ibge: 0,
              id: "6afd005a-bbe5-11ea-b3de-0242ac130004",
              nome: "string",
              pais: "string",
              populacao: 0,
              uf: "uf"),
        ),
        nome: "string",
        tipoPatrimonio: TipoPatrimonioModel(
          createdAt: "2020-07-01T23:18:06.056Z[UTC]",
          descricao: "tipopatrimonio",
          id: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
        ),
        valor: 0,
      ),
      patrimonioOut: PatrimonioModel(
        createdAt: "2020-07-01T23:18:06.081Z[UTC]",
        dataFim: "01/07/2020",
        dataInicio: "01/07/2020",
        id: "6afd0578-bbe5-11ea-b3de-0242ac130004",
        localizacao: LocalizacaoModel(
          bairro: "string",
          cep: "string",
          complemento: "string",
          createdAt: "2020-07-01T23:18:06.074Z[UTC]",
          endereco: "string",
          id: "6afd03de-bbe5-11ea-b3de-0242ac130004",
          latitude: 0,
          longitude: 0,
          municipio: MunicipioModel(
              createdAt: "2020-07-01T23:18:06.063Z[UTC]",
              ibge: 0,
              id: "6afd005a-bbe5-11ea-b3de-0242ac130004",
              nome: "string",
              pais: "string",
              populacao: 0,
              uf: "uf"),
        ),
        nome: "string",
        tipoPatrimonio: TipoPatrimonioModel(
          createdAt: "2020-07-01T23:18:06.056Z[UTC]",
          descricao: "tipopatrimonio",
          id: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
        ),
        valor: 0,
      ),
      valor: 0);

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
