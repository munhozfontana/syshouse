import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dependente.dart';

part 'dependente_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DependenteModel extends Dependente {
  DependenteModel({
    String id,
    String nome,
    String pagadorId,
  }) : super(
          id: id,
          pagadorId: pagadorId,
          nome: nome,
        );
  factory DependenteModel.fromJson(Map<String, dynamic> json) =>
      _$DependenteModelFromJson(json);
  Map<String, dynamic> toJson() => _$DependenteModelToJson(this);
}
