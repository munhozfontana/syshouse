import 'package:equatable/equatable.dart';

import 'localizacao.dart';
import 'tipo_patrimonio.dart';

class Patrimonio extends Equatable {
  final String id;
  final String createdAt;
  final String nome;
  final double valor;
  final String dataInicio;
  final String dataFim;
  final TipoPatrimonio tipoPatrimonio;
  final Localizacao localizacao;

  Patrimonio({
    this.id,
    this.createdAt,
    this.nome,
    this.valor,
    this.dataInicio,
    this.dataFim,
    this.tipoPatrimonio,
    this.localizacao,
  });

  @override
  List<Object> get props => [id];
}
