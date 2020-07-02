import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pagamento_patrimonio.dart';
import 'pagamento_model.dart';
import 'patrimonio_model.dart';

part 'pagamento_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PagamentoPatrimonioModel extends PagamentoPatrimonio {
  final PagamentoModel pagamento;
  final PatrimonioModel patrimonio;

  PagamentoPatrimonioModel({
    String id,
    String createdAt,
    this.pagamento,
    this.patrimonio,
    double valorCalculado,
  }) : super(
          id: id,
          createdAt: createdAt,
          pagamento: pagamento,
          patrimonio: patrimonio,
          valorCalculado: valorCalculado,
        );

  factory PagamentoPatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$PagamentoPatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$PagamentoPatrimonioModelToJson(this);
}
