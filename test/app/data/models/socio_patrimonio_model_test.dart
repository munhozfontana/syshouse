import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/socio_model.dart';
import 'package:syshouse/app/data/models/socio_patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/socio_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tSocioPatrimonioModel = SocioPatrimonioModel(
      createdAt: "2020-07-02T18:04:38.06Z[UTC]",
      id: "6afd08a2-bbe5-11ea-b3de-0242ac130004",
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
              )),
          nome: "string",
          tipoPatrimonio: TipoPatrimonioModel(
            createdAt: "2020-07-02T18:04:38.018Z[UTC]",
            descricao: "tipopatrimonio",
            id: "6afcfd94-bbe5-11ea-b3de-0242ac130004",
          ),
          valor: 0),
      porcentagem: 0,
      proprietario: false,
      socio: SocioModel(
        cpf: "string",
        createdAt: "2020-07-02T18:04:38.051Z[UTC]",
        estadoCivil: "string",
        id: "6afd07da-bbe5-11ea-b3de-0242ac130004",
        nacionalidade: "string",
        nome: "string",
        profissao: "string",
        rg: "string",
      ));

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
