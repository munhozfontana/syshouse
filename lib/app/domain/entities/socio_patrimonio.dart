import 'package:equatable/equatable.dart';

class SocioPatrimonio extends Equatable {
  final String id;

  final String socioId;
  final String patrimonioId;
  final double porcentagem;
  final bool proprietario;

  SocioPatrimonio({
    this.id,
    this.socioId,
    this.patrimonioId,
    this.porcentagem,
    this.proprietario,
  });

  @override
  List<Object> get props => [id];
}
