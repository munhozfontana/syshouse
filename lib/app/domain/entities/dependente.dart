import 'package:equatable/equatable.dart';

import 'pagador.dart';

class Dependente extends Equatable {
  final String id;
  final String createdAt;
  final Pagador pagador;
  final String nome;

  Dependente({
    this.id,
    this.createdAt,
    this.pagador,
    this.nome,
  });

  @override
  List<Object> get props => [id];
}
