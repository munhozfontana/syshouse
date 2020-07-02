import "package:equatable/equatable.dart";

import 'pagador.dart';
import 'socio.dart';

class Contato extends Equatable {
  final String id;
  final String createdAt;
  final String fone;
  final bool whatsapp;
  final String email;
  final Pagador pagador;
  final Socio socio;

  Contato({
    this.id,
    this.createdAt,
    this.fone,
    this.whatsapp,
    this.email,
    this.pagador,
    this.socio,
  });

  @override
  List<Object> get props => [id];
}
