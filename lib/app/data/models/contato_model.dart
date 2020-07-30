import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/contato.dart';

part 'contato_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ContatoModel extends Contato {
  ContatoModel({
    String id,
    String fone,
    bool whatsapp,
    String email,
    String pagadorId,
    String socioId,
  }) : super(
          id: id,
          fone: fone,
          whatsapp: whatsapp,
          email: email,
          pagadorId: pagadorId,
          socioId: socioId,
        );

  factory ContatoModel.fromJson(Map<String, dynamic> json) =>
      _$ContatoModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContatoModelToJson(this);
}
