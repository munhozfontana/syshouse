enum ReponseStatus {
  ok,
  clientError,
  serverError,
}

extension ReponseStatusExt on ReponseStatus {
  Map get status {
    switch (this) {
      case ReponseStatus.clientError:
        return {'min': 400, 'max': 499};
      case ReponseStatus.serverError:
        return {'min': 500, 'max': 599};
      default:
        return null;
    }
  }
}
