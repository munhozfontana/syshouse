import 'package:equatable/equatable.dart';

class TipoDespesa extends Equatable {
  final String id;
  final String createdAt;
  final String descricao;

  TipoDespesa({
    this.id,
    this.createdAt,
    this.descricao,
  });

  @override
  List<Object> get props => [id];
}
