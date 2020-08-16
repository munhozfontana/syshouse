abstract class DatasourcesApi {
  Future<Object> find(String id);

  Future<List<Object>> list();

  Future<List<Object>> listPage(int page, int size);

  Future<Object> save(Object body);

  Future<Object> delete(String id);
}
