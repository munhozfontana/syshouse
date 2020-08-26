import 'package:equatable/equatable.dart';

class Localizacao extends Equatable {
  final String id;

  final String endereco;
  final String bairro;
  final String cep;
  final String complemento;
  final double latitude;
  final double longitude;
  final String municipioId;

  Localizacao({
    this.id,
    this.endereco,
    this.bairro,
    this.cep,
    this.complemento,
    this.latitude,
    this.longitude,
    this.municipioId,
  });

  @override
  List<Object> get props => [id];
}
