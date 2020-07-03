import 'package:equatable/equatable.dart';

import 'patrimonio.dart';
import 'socio.dart';

class SocioPatrimonio extends Equatable {
  final String id;
  final String createdAt;
  final Socio socio;
  final Patrimonio patrimonio;
  final double porcentagem;
  final bool proprietario;

  SocioPatrimonio({
    this.id,
    this.createdAt,
    this.socio,
    this.patrimonio,
    this.porcentagem,
    this.proprietario,
  });

  @override
  List<Object> get props => [id];
}
