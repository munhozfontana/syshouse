import '../../../../core/error/exceptions.dart';
import '../../../../core/network/http_adapter.dart';
import 'datasources_enum_api.dart';

mixin DatasourcesApiValidation {
  void validate(ResponseAdapter responseAdapter);
}

class ApiValidationImpl implements DatasourcesApiValidation {
  @override
  void validate(ResponseAdapter responseAdapter) {
    if (responseAdapter.statusCode >= ReponseStatus.clientError.status['min'] &&
        responseAdapter.statusCode <= ReponseStatus.clientError.status['max']) {
      throw ClientServerApiException(error: responseAdapter.body);
    }

    if (responseAdapter.statusCode >= ReponseStatus.serverError.status['min'] &&
        responseAdapter.statusCode <= ReponseStatus.serverError.status['max']) {
      throw InternalServerApiException(error: responseAdapter.body);
    }
  }
}
