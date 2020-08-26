import 'package:equatable/equatable.dart';

class TipoPatrimonio extends Equatable {
  final String id;

  final String descricao;

  TipoPatrimonio({
    this.id,
    this.descricao,
  });

  @override
  List<Object> get props => [id];
}
