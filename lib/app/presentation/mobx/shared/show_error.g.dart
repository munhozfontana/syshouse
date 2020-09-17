// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_error.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShowError on _ShowErrorBase, Store {
  Computed<bool> _$getHasErrorComputed;

  @override
  bool get getHasError =>
      (_$getHasErrorComputed ??= Computed<bool>(() => super.getHasError,
              name: '_ShowErrorBase.getHasError'))
          .value;
  Computed<String> _$getMessageErrorComputed;

  @override
  String get getMessageError => (_$getMessageErrorComputed ??= Computed<String>(
          () => super.getMessageError,
          name: '_ShowErrorBase.getMessageError'))
      .value;

  final _$hasErrorAtom = Atom(name: '_ShowErrorBase.hasError');

  @override
  Failure get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(Failure value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$setHasErrorAsyncAction = AsyncAction('_ShowErrorBase.setHasError');

  @override
  Future<void> setHasError(Failure failure, {Duration durationToResetError}) {
    return _$setHasErrorAsyncAction.run(() =>
        super.setHasError(failure, durationToResetError: durationToResetError));
  }

  final _$_ShowErrorBaseActionController =
      ActionController(name: '_ShowErrorBase');

  @override
  void resetError() {
    final _$actionInfo = _$_ShowErrorBaseActionController.startAction(
        name: '_ShowErrorBase.resetError');
    try {
      return super.resetError();
    } finally {
      _$_ShowErrorBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
<<<<<<< HEAD
hasError: ${hasError},
=======
>>>>>>> 983f0fb8be3f379994cc2a21ab5705e418eca452
getHasError: ${getHasError},
getMessageError: ${getMessageError}
    ''';
  }
}
