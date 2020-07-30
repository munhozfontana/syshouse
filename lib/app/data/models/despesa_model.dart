import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/despesa.dart';

part 'despesa_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DespesaModel extends Despesa {
  DespesaModel({
    String id,
    String tipoDespesaId,
    String patrimonioId,
    String descricao,
    double valor,
    String vencimento,
    String dataInicio,
    String dataFim,
    String obs,
  }) : super(
          id: id,
          tipoDespesaId: tipoDespesaId,
          patrimonioId: patrimonioId,
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
