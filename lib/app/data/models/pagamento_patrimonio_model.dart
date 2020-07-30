import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagamento_patrimonio.dart';

part 'pagamento_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagamentoPatrimonioModel extends PagamentoPatrimonio {
  PagamentoPatrimonioModel({
    String id,
    String pagamentoId,
    String patrimonioId,
    double valorCalculado,
  }) : super(
          id: id,
          pagamentoId: pagamentoId,
          patrimonioId: patrimonioId,
          valorCalculado: valorCalculado,
        );

  factory PagamentoPatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$PagamentoPatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$PagamentoPatrimonioModelToJson(this);
}
