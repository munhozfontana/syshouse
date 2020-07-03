import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/socio_patrimonio.dart';
import 'patrimonio_model.dart';
import 'socio_model.dart';

part 'socio_patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SocioPatrimonioModel extends SocioPatrimonio {
  final SocioModel socio;
  final PatrimonioModel patrimonio;

  SocioPatrimonioModel({
    String id,
    String createdAt,
    this.socio,
    this.patrimonio,
    double porcentagem,
    bool proprietario,
  }) : super(
          id: id,
          createdAt: createdAt,
          socio: socio,
          patrimonio: patrimonio,
          porcentagem: porcentagem,
          proprietario: proprietario,
        );
  factory SocioPatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$SocioPatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$SocioPatrimonioModelToJson(this);
}
