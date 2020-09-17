import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../../core/error/failure.dart';

part 'show_error.g.dart';

class ShowError = _ShowErrorBase with _$ShowError;

abstract class _ShowErrorBase with Store {
  @observable
  Failure hasError;

  @action
  Future<void> setHasError(
    Failure failure, {
    Duration durationToResetError,
  }) async {
    hasError = failure;
    if (durationToResetError != null) {
      Timer(durationToResetError, resetError);
    }
  }

  @computed
  bool get getHasError {
    return hasError == null ? false : true;
  }

  @computed
  String get getMessageError {
    return hasError == null ? "" : hasError.message;
  }

  @action
  void resetError() {
    hasError = null;
  }
}
