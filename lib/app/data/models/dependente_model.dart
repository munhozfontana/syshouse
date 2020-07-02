import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/dependente.dart';
import 'pagador_model.dart';

part 'dependente_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DependenteModel extends Dependente {
  final PagadorModel pagador;

  DependenteModel({String id, String createdAt, String nome, this.pagador})
      : super(
          id: id,
          createdAt: createdAt,
          pagador: pagador,
          nome: nome,
        );
  factory DependenteModel.fromJson(Map<String, dynamic> json) =>
      _$DependenteModelFromJson(json);
  Map<String, dynamic> toJson() => _$DependenteModelToJson(this);
}
