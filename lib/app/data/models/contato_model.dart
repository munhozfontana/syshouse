import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/contato.dart';
import 'pagador_model.dart';
import 'socio_model.dart';

part 'contato_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContatoModel extends Contato {
  final PagadorModel pagador;
  final SocioModel socio;

  ContatoModel({
    String id,
    String createdAt,
    String fone,
    bool whatsapp,
    String email,
    this.pagador,
    this.socio,
  }) : super(
          id: id,
          createdAt: createdAt,
          fone: fone,
          whatsapp: whatsapp,
          email: email,
          pagador: pagador,
          socio: socio,
        );

  factory ContatoModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContatoModelToJson(this);
}
