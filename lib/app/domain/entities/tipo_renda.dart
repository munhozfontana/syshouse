import 'package:equatable/equatable.dart';

class TipoRenda extends Equatable {
  final String descricao;
  final String id;

  TipoRenda({
    this.descricao,
    this.id,
  });

  @override
  List<Object> get props => [id];
}
