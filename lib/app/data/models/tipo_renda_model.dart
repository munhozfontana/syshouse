import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/tipo_renda.dart';

part 'tipo_renda_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TipoRendaModel extends TipoRenda {
  TipoRendaModel({
    String id,
    String descricao,
  }) : super(
          id: id,
          descricao: descricao,
        );

  factory TipoRendaModel.fromJson(Map<String, Object> json) =>
      _$TipoRendaModelFromJson(json);
  Map<String, Object> toJson() => _$TipoRendaModelToJson(this);
}
