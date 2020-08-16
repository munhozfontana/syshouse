import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/movimentacao.dart';

part 'movimentacao_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MovimentacaoModel extends Movimentacao {
  MovimentacaoModel({
    String id,
    String patrimonioIn,
    String patrimonioOut,
    double valor,
    String data,
    String obs,
  }) : super(
          id: id,
          patrimonioIn: patrimonioIn,
          patrimonioOut: patrimonioOut,
          valor: valor,
          data: data,
          obs: obs,
        );

  factory MovimentacaoModel.fromJson(Map<String, Object> json) =>
      _$MovimentacaoModelFromJson(json);
  Map<String, Object> toJson() => _$MovimentacaoModelToJson(this);
}
