import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../../../core/error/failure.dart';

part 'show_error.g.dart';

class ShowError = _ShowErrorBase with _$ShowError;

abstract class _ShowErrorBase with Store {
  @observable
  Failure _hasError;

  @action
  Future<void> setHasError(
    Failure failure, {
    Duration durationToResetError,
  }) async {
    _hasError = failure;
    if (durationToResetError != null) {
      Timer(durationToResetError, _resetError);
    }
  }

  @computed
  bool get getHasError {
    return _hasError == null ? false : true;
  }

  @computed
  String get getMessageError {
    return _hasError == null ? "" : _hasError.message;
  }

  @action
  void _resetError() {
    _hasError = null;
  }
}
