import '../models/dependente_model.dart';

abstract class DependenteApi {
  Future<DependenteModel> findDependente(int idDependente);

  Future<DependenteModel> listAllDependente(int idDependente);

  Future<DependenteModel> listAllPageDependente(int idDependente);

  Future<DependenteModel> insertDependente(int idDependente);

  Future<DependenteModel> updateDependente(int idDependente);

  Future<DependenteModel> deleteDependente(int idDependente);
}
