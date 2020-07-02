import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/midia.dart';
import 'patrimonio_model.dart';

part 'midia_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MidiaModel extends Midia {
  final PatrimonioModel patrimonio;

  MidiaModel({
    String id,
    String createdAt,
    this.patrimonio,
    String nome,
    String caminho,
    String obs,
    String tipo,
  }) : super(
          id: id,
          createdAt: createdAt,
          patrimonio: patrimonio,
          nome: nome,
          caminho: caminho,
          obs: obs,
          tipo: tipo,
        );

  factory MidiaModel.fromJson(Map<String, dynamic> json) =>
      _$MidiaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MidiaModelToJson(this);
}
