import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/despesa.dart';
import 'patrimonio_model.dart';
import 'tipo_despesa_model.dart';

part 'despesa_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DespesaModel extends Despesa {
  final TipoDespesaModel tipoDespesa;
  final PatrimonioModel patrimonio;

  DespesaModel({
    String id,
    String createdAt,
    this.tipoDespesa,
    this.patrimonio,
    String descricao,
    double valor,
    String vencimento,
    String dataInicio,
    String dataFim,
    String obs,
  }) : super(
          id: id,
          createdAt: createdAt,
          tipoDespesa: tipoDespesa,
          patrimonio: patrimonio,
          descricao: descricao,
          valor: valor,
          vencimento: vencimento,
          dataInicio: dataInicio,
          dataFim: dataFim,
          obs: obs,
        );

  factory DespesaModel.fromJson(Map<String, dynamic> json) =>
      _$DespesaModelFromJson(json);
  Map<String, dynamic> toJson() => _$DespesaModelToJson(this);
}
