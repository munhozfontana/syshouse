import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagamento.dart';

part 'pagamento_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagamentoModel extends Pagamento {
  PagamentoModel({
    String id,
    String despesaId,
    double valor,
    String dataPagamento,
    String obs,
  }) : super(
          id: id,
          despesaId: despesaId,
          valor: valor,
          dataPagamento: dataPagamento,
          obs: obs,
        );
  factory PagamentoModel.fromJson(Map<String, Object> json) =>
      _$PagamentoModelFromJson(json);
  Map<String, Object> toJson() => _$PagamentoModelToJson(this);
}
