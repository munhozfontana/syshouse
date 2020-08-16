import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/midia.dart';

part 'midia_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MidiaModel extends Midia {
  MidiaModel({
    String id,
    String patrimonioId,
    String nome,
    String caminho,
    String obs,
    String tipo,
  }) : super(
          id: id,
          patrimonioId: patrimonioId,
          nome: nome,
          caminho: caminho,
          obs: obs,
          tipo: tipo,
        );

  factory MidiaModel.fromJson(Map<String, Object> json) =>
      _$MidiaModelFromJson(json);
  Map<String, Object> toJson() => _$MidiaModelToJson(this);
}
