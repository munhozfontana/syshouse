import 'package:equatable/equatable.dart';

class Dependente extends Equatable {
  final String id;
  final String createdAt;
  final String pagadorId;
  final String nome;

  Dependente({
    this.id,
    this.createdAt,
    this.pagadorId,
    this.nome,
  });

  @override
  List<Object> get props => [id];
}
