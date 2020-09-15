// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadingStore on _LoadingStoreBase, Store {
  final _$loadStateAtom = Atom(name: '_LoadingStoreBase.loadState');

  @override
  EnumLoadState get loadState {
    _$loadStateAtom.reportRead();
    return super.loadState;
  }

  @override
  set loadState(EnumLoadState value) {
    _$loadStateAtom.reportWrite(value, super.loadState, () {
      super.loadState = value;
    });
  }

  final _$setLoadStateAsyncAction =
      AsyncAction('_LoadingStoreBase.setLoadState');

  @override
  Future<void> setLoadState(EnumLoadState newState) {
    return _$setLoadStateAsyncAction.run(() => super.setLoadState(newState));
  }

  @override
  String toString() {
    return '''
loadState: ${loadState}
    ''';
  }
}
