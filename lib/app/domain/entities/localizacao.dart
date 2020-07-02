import 'package:equatable/equatable.dart';

import 'municipio.dart';

class Localizacao extends Equatable {
  final String id;
  final String createdAt;
  final String endereco;
  final String bairro;
  final String cep;
  final String complemento;
  final double latitude;
  final double longitude;
  final Municipio municipio;

  Localizacao({
    this.id,
    this.createdAt,
    this.endereco,
    this.bairro,
    this.cep,
    this.complemento,
    this.latitude,
    this.longitude,
    this.municipio,
  });

  @override
  List<Object> get props => [id];
}
