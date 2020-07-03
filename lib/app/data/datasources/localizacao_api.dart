import '../models/localizacao_model.dart';

abstract class LocalizacaoApi {
  Future<LocalizacaoModel> findLocalizacao(int idLocalizacao);

  Future<LocalizacaoModel> listAllLocalizacao(int idLocalizacao);

  Future<LocalizacaoModel> listAllPageLocalizacao(int idLocalizacao);

  Future<LocalizacaoModel> insertLocalizacao(int idLocalizacao);

  Future<LocalizacaoModel> updateLocalizacao(int idLocalizacao);

  Future<LocalizacaoModel> deleteLocalizacao(int idLocalizacao);
}
