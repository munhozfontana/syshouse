enum MessagesRepository { noConnection }

extension MessagesRepositoryImpl on MessagesRepository {
  String get value {
    switch (this) {
      case MessagesRepository.noConnection:
        return "Sem conexão";
        break;
      default:
        return "Sem Menssagem";
    }
  }
}
