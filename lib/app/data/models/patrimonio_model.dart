import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/patrimonio.dart';

part 'patrimonio_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PatrimonioModel extends Patrimonio {
  PatrimonioModel({
    String id,
    String nome,
    double valor,
    String dataInicio,
    String dataFim,
    String tipoPatrimonioId,
    String localizacaoId,
  }) : super(
          id: id,
          nome: nome,
          valor: valor,
          dataInicio: dataInicio,
          dataFim: dataFim,
          tipoPatrimonioId: tipoPatrimonioId,
          localizacaoId: localizacaoId,
        );

  factory PatrimonioModel.fromJson(Map<String, dynamic> json) =>
      _$PatrimonioModelFromJson(json);
  Map<String, dynamic> toJson() => _$PatrimonioModelToJson(this);
}
