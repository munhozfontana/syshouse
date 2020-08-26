import 'package:equatable/equatable.dart';

class TipoDespesa extends Equatable {
  final String id;

  final String descricao;

  TipoDespesa({
    this.id,
    this.descricao,
  });

  @override
  List<Object> get props => [id];
}
