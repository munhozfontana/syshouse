import '../../domain/entities/socio.dart';

class SocioModel extends Socio {
  SocioModel({
    String id,
    String createdAt,
    String nome,
    String cpf,
    String rg,
    String nacionalidade,
    String estadoCivil,
    String profissao,
  }) : super(
          id: id,
          createdAt: createdAt,
          nome: nome,
          cpf: cpf,
          rg: rg,
          nacionalidade: nacionalidade,
          estadoCivil: estadoCivil,
          profissao: profissao,
        );

  factory SocioModel.fromJson(Map<String, dynamic> jsonMap) {
    return SocioModel(
        id: jsonMap['id'],
        createdAt: jsonMap['createdAt'],
        nome: jsonMap['nome'],
        cpf: jsonMap['cpf'],
        rg: jsonMap['rg'],
        nacionalidade: jsonMap['nacionalidade'],
        estadoCivil: jsonMap['estadoCivil'],
        profissao: jsonMap['profissao']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'nome': nome,
      'cpf': cpf,
      'rg': rg,
      'nacionalidade': nacionalidade,
      'estadoCivil': estadoCivil,
      'profissao': profissao,
    };
  }
}
