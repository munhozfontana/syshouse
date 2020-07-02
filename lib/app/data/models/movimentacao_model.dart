import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movimentacao.dart';
import 'patrimonio_model.dart';

part 'movimentacao_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovimentacaoModel extends Movimentacao {
  final PatrimonioModel patrimonioIn;
  final PatrimonioModel patrimonioOut;

  MovimentacaoModel({
    String id,
    String createdAt,
    this.patrimonioIn,
    this.patrimonioOut,
    double valor,
    String data,
    String obs,
  }) : super(
          id: id,
          createdAt: createdAt,
          patrimonioIn: patrimonioIn,
          patrimonioOut: patrimonioOut,
          valor: valor,
          data: data,
          obs: obs,
        );

  factory MovimentacaoModel.fromJson(Map<String, dynamic> json) =>
      _$MovimentacaoModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovimentacaoModelToJson(this);
}
