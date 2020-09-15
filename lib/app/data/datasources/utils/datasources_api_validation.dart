import '../../../../core/error/exceptions.dart';
import '../../../../core/network/http_adapter.dart';
import 'datasources_enum_api.dart';

mixin DatasourcesApiValidation {
  void validate(ResponseAdapter responseAdapter);
}

class ApiValidationImpl implements DatasourcesApiValidation {
  String serverError = "Erro interno so servidor";
  String clientError = "Erro no cliente";

  @override
  void validate(ResponseAdapter responseAdapter) {
    if (responseAdapter.statusCode >= ReponseStatus.clientError.status['min'] &&
        responseAdapter.statusCode <= ReponseStatus.clientError.status['max']) {
      throw ClientServerApiException(
          error: "$clientError, Status: ${responseAdapter.statusCode}");
    }

    if (responseAdapter.statusCode >= ReponseStatus.serverError.status['min'] &&
        responseAdapter.statusCode <= ReponseStatus.serverError.status['max']) {
      throw InternalServerApiException(
        error: "$serverError, Status: ${responseAdapter.statusCode}",
      );
    }
  }
}
