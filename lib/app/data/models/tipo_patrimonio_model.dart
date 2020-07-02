import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/tipo_patrimonio.dart';

part 'tipo_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TipoPatrimonioModel extends TipoPatrimonio {
  TipoPatrimonioModel({
    String id,
    String createdAt,
    String descricao,
  }) : super(
          id: id,
          createdAt: createdAt,
          descricao: descricao,
        );

  factory TipoPatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$TipoPatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$TipoPatrimonioModelToJson(this);
}
