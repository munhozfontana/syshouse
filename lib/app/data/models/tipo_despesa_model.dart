import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/tipo_despesa.dart';

part 'tipo_despesa_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TipoDespesaModel extends TipoDespesa {
  TipoDespesaModel({
    String id,
    String descricao,
  }) : super(
          id: id,
          descricao: descricao,
        );

  factory TipoDespesaModel.fromJson(Map<String, Object> json) =>
      _$TipoDespesaModelFromJson(json);
  Map<String, Object> toJson() => _$TipoDespesaModelToJson(this);
}
