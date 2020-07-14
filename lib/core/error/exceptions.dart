class ServerApiException implements Exception {
  final String error;

  ServerApiException({this.error});
}
