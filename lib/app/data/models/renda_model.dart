import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/renda.dart';
import 'pagador_model.dart';
import 'patrimonio_model.dart';
import 'tipo_renda_model.dart';

part 'renda_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RendaModel extends Renda {
  final PagadorModel pagador;
  final TipoRendaModel tipoRenda;
  final PatrimonioModel patrimonio;

  RendaModel({
    String id,
    String createdAt,
    this.pagador,
    this.tipoRenda,
    this.patrimonio,
    String descricao,
    double valor,
    String vencimento,
    String dataInicio,
    String dataFim,
    String obs,
  }) : super(
          id: id,
          createdAt: createdAt,
          pagador: pagador,
          tipoRenda: tipoRenda,
          patrimonio: patrimonio,
          descricao: descricao,
          valor: valor,
          vencimento: vencimento,
          dataInicio: dataInicio,
          dataFim: dataFim,
          obs: obs,
        );

  factory RendaModel.fromJson(Map<String, dynamic> json) =>
      _$RendaModelFromJson(json);
  Map<String, dynamic> toJson() => _$RendaModelToJson(this);
}
