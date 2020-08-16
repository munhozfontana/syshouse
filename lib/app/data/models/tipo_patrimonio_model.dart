import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/tipo_patrimonio.dart';

part 'tipo_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TipoPatrimonioModel extends TipoPatrimonio {
  TipoPatrimonioModel({
    String id,
    String descricao,
  }) : super(
          id: id,
          descricao: descricao,
        );

  factory TipoPatrimonioModel.fromJson(Map<String, Object> json) =>
      _$TipoPatrimonioModelFromJson(json);
  Map<String, Object> toJson() => _$TipoPatrimonioModelToJson(this);
}
