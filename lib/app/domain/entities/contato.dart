import "package:equatable/equatable.dart";

class Contato extends Equatable {
  final String id;
  final String fone;
  final bool whatsapp;
  final String email;
  final String pagadorId;
  final String socioId;

  Contato({
    this.id,
    this.fone,
    this.whatsapp,
    this.email,
    this.pagadorId,
    this.socioId,
  });

  @override
  List<Object> get props => [id, fone, whatsapp, email, pagadorId, socioId];
}
