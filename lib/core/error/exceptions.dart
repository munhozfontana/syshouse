class ClientServerErrorException implements Exception {
  final String error;

  ClientServerErrorException({this.error});
}

class InternalServerErrorException implements Exception {
  final String error;

  InternalServerErrorException({this.error});
}
