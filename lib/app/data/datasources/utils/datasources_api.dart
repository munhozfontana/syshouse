abstract class DatasourcesApi {
  Future<dynamic> find(String id);

  Future<List<dynamic>> list();

  Future<List<dynamic>> listPage(int page, int size);

  Future<dynamic> save(Map<String, dynamic> body);

  Future<dynamic> delete(String id);
}
