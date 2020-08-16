import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/renda.dart';

part 'renda_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RendaModel extends Renda {
  RendaModel({
    String id,
    String pagadorId,
    String tipoRendaId,
    String patrimonioId,
    String descricao,
    double valor,
    String vencimento,
    String dataInicio,
    String dataFim,
    String obs,
  }) : super(
          id: id,
          pagadorId: pagadorId,
          tipoRendaId: tipoRendaId,
          patrimonioId: patrimonioId,
          descricao: descricao,
          valor: valor,
          vencimento: vencimento,
          dataInicio: dataInicio,
          dataFim: dataFim,
          obs: obs,
        );

  factory RendaModel.fromJson(Map<String, Object> json) =>
      _$RendaModelFromJson(json);
  Map<String, Object> toJson() => _$RendaModelToJson(this);
}
