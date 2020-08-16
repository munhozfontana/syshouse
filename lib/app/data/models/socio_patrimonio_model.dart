import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/socio_patrimonio.dart';

part 'socio_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SocioPatrimonioModel extends SocioPatrimonio {
  SocioPatrimonioModel({
    String id,
    String socioId,
    String patrimonioId,
    double porcentagem,
    bool proprietario,
  }) : super(
          id: id,
          socioId: socioId,
          patrimonioId: patrimonioId,
          porcentagem: porcentagem,
          proprietario: proprietario,
        );
  factory SocioPatrimonioModel.fromJson(Map<String, Object> json) =>
      _$SocioPatrimonioModelFromJson(json);
  Map<String, Object> toJson() => _$SocioPatrimonioModelToJson(this);
}
