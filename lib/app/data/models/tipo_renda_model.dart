import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/tipo_renda.dart';

part 'tipo_renda_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TipoRendaModel extends TipoRenda {
  TipoRendaModel({
    String id,
    String createdAt,
    String descricao,
  }) : super(
          id: id,
          createdAt: createdAt,
          descricao: descricao,
        );

  factory TipoRendaModel.fromJson(Map<String, dynamic> json) =>
      _$TipoRendaModelFromJson(json);
  Map<String, dynamic> toJson() => _$TipoRendaModelToJson(this);
}
