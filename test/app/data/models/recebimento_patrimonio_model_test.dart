import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/pagador_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/recebimento_model.dart';
import 'package:syshouse/app/data/models/recebimento_patrimonio_model.dart';
import 'package:syshouse/app/data/models/renda_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_renda_model.dart';
import 'package:syshouse/app/domain/entities/recebimento_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tRecebimentoPatrimonioModel = RecebimentoPatrimonioModel(
      createdAt: "2020-07-02T18:04:38.082Z[UTC]",
      id: "6afd0e9c-bbe5-11ea-b3de-0242ac130004",
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
                  uf: "uf")),
          nome: "string",
          tipoPatrimonio: TipoPatrimonioModel(
              createdAt: "2020-07-02T18:04:38.018Z[UTC]",
              descricao: "tipopatrimonio",
              id: "6afcfd94-bbe5-11ea-b3de-0242ac130004"),
          valor: 0),
      recebimento: RecebimentoModel(
          createdAt: "2020-07-02T18:04:38.079Z[UTC]",
          dataRecebimento: "02/07/2020",
          id: "6afd0dd4-bbe5-11ea-b3de-0242ac130004",
          obs: "string",
          renda: RendaModel(
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
                  rg: "string"),
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
                          uf: "uf")),
                  nome: "string",
                  tipoPatrimonio: TipoPatrimonioModel(
                      createdAt: "2020-07-02T18:04:38.018Z[UTC]",
                      descricao: "tipopatrimonio",
                      id: "6afcfd94-bbe5-11ea-b3de-0242ac130004"),
                  valor: 0),
              tipoRenda: TipoRendaModel(
                  createdAt: "2020-07-02T18:04:38.026Z[UTC]",
                  descricao: "tiporenda",
                  id: "6afcfec0-bbe5-11ea-b3de-0242ac130004"),
              valor: 0,
              vencimento: "02/07/2020"),
          valor: 0),
      valorCalculado: 0);

  final apiJsonOk = json.decode(fixture('recebimentopatrimonio.json'));
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
