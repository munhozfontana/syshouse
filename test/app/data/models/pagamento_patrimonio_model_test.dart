import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:syshouse/app/data/models/despesa_model.dart';
import 'package:syshouse/app/data/models/localizacao_model.dart';
import 'package:syshouse/app/data/models/municipio_model.dart';
import 'package:syshouse/app/data/models/pagamento_model.dart';
import 'package:syshouse/app/data/models/pagamento_patrimonio_model.dart';
import 'package:syshouse/app/data/models/patrimonio_model.dart';
import 'package:syshouse/app/data/models/tipo_despesa_model.dart';
import 'package:syshouse/app/data/models/tipo_patrimonio_model.dart';
import 'package:syshouse/app/domain/entities/pagamento_patrimonio.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final tPagamentoPatrimonioModel = PagamentoPatrimonioModel(
      createdAt: "2020-07-01T23:18:06.141Z[UTC]",
      id: "6afd2166-bbe5-11ea-b3de-0242ac130004",
      pagamento: PagamentoModel(
        createdAt: "2020-07-01T23:18:06.138Z[UTC]",
        dataPagamento: "01/07/2020",
        despesa: DespesaModel(
          createdAt: "2020-07-01T23:18:06.131Z[UTC]",
          dataFim: "01/07/2020",
          dataInicio: "01/07/2020",
          descricao: "string",
          id: "6afd1d24-bbe5-11ea-b3de-0242ac130004",
          obs: "string",
          patrimonio: PatrimonioModel(
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
          tipoDespesa: TipoDespesaModel(
            createdAt: "2020-07-01T23:18:06.054Z[UTC]",
            descricao: "tipodespesa",
            id: "6afcf8d0-bbe5-11ea-b3de-0242ac130004",
          ),
          valor: 0,
          vencimento: "01/07/2020",
        ),
        id: "6afd206c-bbe5-11ea-b3de-0242ac130004",
        obs: "string",
        valor: 0,
      ),
      patrimonio: PatrimonioModel(
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
      valorCalculado: 0);

  final apiJsonOk = json.decode(fixture('pagamentoPatrimonio.json'));
  test('Sould be a subclass of PagamentoPatrimonioModel', () {
    expect(tPagamentoPatrimonioModel, isA<PagamentoPatrimonio>());
  });

  test('should return a valid model when the JSON is correct', () async {
    final result = PagamentoPatrimonioModel.fromJson(apiJsonOk);

    expect(result, tPagamentoPatrimonioModel);
  });

  test('should return a valid model to Json', () async {
    final result = tPagamentoPatrimonioModel.toJson();

    expect(result, apiJsonOk);
  });
}
