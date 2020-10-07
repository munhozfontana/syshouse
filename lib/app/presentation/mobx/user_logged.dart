import 'package:mobx/mobx.dart';

part 'user_logged.g.dart';

class UserLogged = _UserLoggedBase with _$UserLogged;

abstract class _UserLoggedBase with Store {
  @observable
  String name = '';

  @action
  void setName(String newName) {
    name = newName;
  }
}
