import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/recebimento_patrimonio.dart';
import 'patrimonio_model.dart';
import 'recebimento_model.dart';

part 'recebimento_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecebimentoPatrimonioModel extends RecebimentoPatrimonio {
  final RecebimentoModel recebimento;
  final PatrimonioModel patrimonio;

  RecebimentoPatrimonioModel({
    String id,
    String createdAt,
    this.recebimento,
    this.patrimonio,
    double valorCalculado,
  }) : super(
          id: id,
          createdAt: createdAt,
          recebimento: recebimento,
          patrimonio: patrimonio,
          valorCalculado: valorCalculado,
        );

  factory RecebimentoPatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$RecebimentoPatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$RecebimentoPatrimonioModelToJson(this);
}
