import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recebimento.dart';

part 'recebimento_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecebimentoModel extends Recebimento {
  RecebimentoModel({
    String id,
    String rendaId,
    double valor,
    String dataRecebimento,
    String obs,
  }) : super(
          id: id,
          rendaId: rendaId,
          valor: valor,
          dataRecebimento: dataRecebimento,
          obs: obs,
        );

  factory RecebimentoModel.fromJson(Map<String, Object> json) =>
      _$RecebimentoModelFromJson(json);
  Map<String, Object> toJson() => _$RecebimentoModelToJson(this);
}
