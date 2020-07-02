import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/midia_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/midia.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tMidiaModel = MidiaModel(
      caminho: "string",
      createdAt: "2020-07-01T22:05:29.745Z[UTC]",
      id: "6afd0708-bbe5-11ea-b3de-0242ac130004",
      nome: "string",
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
              id: "6afcfd94-bbe5-11ea-b3de-0242ac130004"),
          valor: 0),
      tipo: "string");

  final apiJsonOk = json.decode(fixture('midia.json'));
  test('Sould be a subclass of MidiaModel', () {
    expect(tMidiaModel, isA<Midia>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = MidiaModel.fromJson(apiJsonOk);

    expect(result, tMidiaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tMidiaModel.toJson();

    expect(result, apiJsonOk);
  });
}
