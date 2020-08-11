class ServerApiException implements Exception {
  final String error;

  ServerApiException({this.error});
}

class ClientServerApiException extends ServerApiException {
  final String error;

  ClientServerApiException({this.error});
}

class InternalServerApiException extends ServerApiException {
  final String error;

  InternalServerApiException({this.error});
}
