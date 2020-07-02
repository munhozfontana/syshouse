import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/patrimonio.dart';
import 'localizacao_model.dart';
import 'tipo_patrimonio_model.dart';

part 'patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PatrimonioModel extends Patrimonio {
  final TipoPatrimonioModel tipoPatrimonio;
  final LocalizacaoModel localizacao;

  PatrimonioModel({
    String id,
    String createdAt,
    String nome,
    double valor,
    String dataInicio,
    String dataFim,
    this.tipoPatrimonio,
    this.localizacao,
  }) : super(
          id: id,
          createdAt: createdAt,
          nome: nome,
          valor: valor,
          dataInicio: dataInicio,
          dataFim: dataFim,
          tipoPatrimonio: tipoPatrimonio,
          localizacao: localizacao,
        );

  factory PatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$PatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatrimonioModelToJson(this);
}
