import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/renda_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/domain/entities/renda.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tRendaModel = RendaModel(
      createdAt: "2020-07-02T18:04:38.077Z[UTC]",
      dataFim: "02/07/2020",
      dataInicio: "02/07/2020",
      descricao: "string",
      id: "6afd0d0c-bbe5-11ea-b3de-0242ac130004",
      obs: "string",
      pagador: PagadorModel(
        cnpj: "string",
        cpf: "string",
        createdAt: "2020-07-02T18:04:38.063Z[UTC]",
        endereco: "string",
        estadoCivil: "string",
        id: "6afd096a-bbe5-11ea-b3de-0242ac130004",
        nacionalidade: "string",
        nascimento: "02/07/2020",
        nome: "string",
        profissao: "string",
        rg: "string",
      ),
      patrimonio: PatrimonioModel(
        createdAt: "2020-07-02T18:04:38.036Z[UTC]",
        dataFim: "02/07/2020",
        dataInicio: "02/07/2020",
        id: "6afd04b0-bbe5-11ea-b3de-0242ac130004",
        localizacao: LocalizacaoModel(
          bairro: "string",
          cep: "string",
          complemento: "string",
          createdAt: "2020-07-02T18:04:38.031Z[UTC]",
          endereco: "string",
          id: "6afd0154-bbe5-11ea-b3de-0242ac130004",
          latitude: 0,
          longitude: 0,
          municipio: MunicipioModel(
            createdAt: "2020-07-02T18:04:38.029Z[UTC]",
            ibge: 0,
            id: "6afd005a-bbe5-11ea-b3de-0242ac130004",
            nome: "string",
            pais: "string",
            populacao: 0,
            uf: "uf",
          ),
        ),
        nome: "string",
        tipoPatrimonio: TipoPatrimonioModel(
          createdAt: "2020-07-02T18:04:38.018Z[UTC]",
          descricao: "tipopatrimonio",
          id: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
        ),
        valor: 0,
      ),
      tipoRenda: TipoRendaModel(
        createdAt: "2020-07-02T18:04:38.026Z[UTC]",
        descricao: "tiporenda",
        id: "6afcfec0-bbe5-11ea-b3de-0242ac130004",
      ),
      valor: 0,
      vencimento: "02/07/2020");

  final apiJsonOk = json.decode(fixture('renda.json'));
  test('Sould be a subclass of RendaModel', () {
    expect(tRendaModel, isA<Renda>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = RendaModel.fromJson(apiJsonOk);

    expect(result, tRendaModel);
  });

  test('should return a valid model to Json', () async {
    final result = tRendaModel.toJson();

    expect(result, apiJsonOk);
  });
}
