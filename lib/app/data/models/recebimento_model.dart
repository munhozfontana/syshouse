import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recebimento.dart';
import 'renda_model.dart';

part 'recebimento_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecebimentoModel extends Recebimento {
  final RendaModel renda;

  RecebimentoModel({
    String id,
    String createdAt,
    this.renda,
    double valor,
    String dataRecebimento,
    String obs,
  }) : super(
          id: id,
          createdAt: createdAt,
          renda: renda,
          valor: valor,
          dataRecebimento: dataRecebimento,
          obs: obs,
        );

  factory RecebimentoModel.fromJson(Map<String, dynamic> json) =>
      _$RecebimentoModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecebimentoModelToJson(this);
}
