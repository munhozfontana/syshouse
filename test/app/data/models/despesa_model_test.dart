import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/despesa_model.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/despesa.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tDespesaModel = DespesaModel(
      createdAt: "2020-07-01T22:05:29.791Z[UTC]",
      dataFim: "01/07/2020",
      dataInicio: "01/07/2020",
      descricao: "string",
      id: "6afd1d24-bbe5-11ea-b3de-0242ac130004",
      obs: "string",
      patrimonio: PatrimonioModel(
        createdAt: "2020-07-01T22:05:29.727Z[UTC]",
        dataFim: "01/07/2020",
        dataInicio: "01/07/2020",
        id: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
        localizacao: LocalizacaoModel(
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
        ),
        nome: "string",
        tipoPatrimonio: TipoPatrimonioModel(
          createdAt: "2020-07-01T22:05:29.708Z[UTC]",
          descricao: "tipopatrimonio",
          id: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
        ),
        valor: 0,
      ),
      tipoDespesa: TipoDespesaModel(
        createdAt: "2020-07-01T22:05:29.7Z[UTC]",
        descricao: "tipodespesa",
        id: "6afcf8d0-bbe5-11ea-b3de-0242ac130004",
      ),
      valor: 0,
      vencimento: "01/07/2020");

  final apiJsonOk = json.decode(fixture('despesa.json'));
  test('Sould be a subclass of DespesaModel', () {
    expect(tDespesaModel, isA<Despesa>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = DespesaModel.fromJson(apiJsonOk);

    expect(result, tDespesaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tDespesaModel.toJson();

    expect(result, apiJsonOk);
  });
}
