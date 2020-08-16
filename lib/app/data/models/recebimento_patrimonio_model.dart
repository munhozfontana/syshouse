import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recebimento_patrimonio.dart';

part 'recebimento_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecebimentoPatrimonioModel extends RecebimentoPatrimonio {
  RecebimentoPatrimonioModel({
    String id,
    String recebimentoId,
    String patrimonioId,
    double valorCalculado,
  }) : super(
          id: id,
          recebimentoId: recebimentoId,
          patrimonioId: patrimonioId,
          valorCalculado: valorCalculado,
        );

  factory RecebimentoPatrimonioModel.fromJson(Map<String, Object> json) =>
      _$RecebimentoPatrimonioModelFromJson(json);
  Map<String, Object> toJson() => _$RecebimentoPatrimonioModelToJson(this);
}
