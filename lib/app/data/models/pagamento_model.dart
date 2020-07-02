import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagamento.dart';
import 'despesa_model.dart';

part 'pagamento_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagamentoModel extends Pagamento {
  final DespesaModel despesa;

  PagamentoModel({
    String id,
    String createdAt,
    this.despesa,
    double valor,
    String dataPagamento,
    String obs,
  }) : super(
          id: id,
          createdAt: createdAt,
          despesa: despesa,
          valor: valor,
          dataPagamento: dataPagamento,
          obs: obs,
        );
  factory PagamentoModel.fromJson(Map<String, dynamic> json) =>
      _$PagamentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PagamentoModelToJson(this);
}
