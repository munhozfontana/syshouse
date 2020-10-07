import 'dart:async';

import 'package:mobx/mobx.dart';

import 'enuns/enum_load_state.dart';

part 'loading_store.g.dart';

class LoadingStore = _LoadingStoreBase with _$LoadingStore;

abstract class _LoadingStoreBase with Store {
  @observable
  EnumLoadState loadState = EnumLoadState.initial;

  @action
  Future<void> setLoadState(EnumLoadState newState) async {
    loadState = newState;
  }
}
