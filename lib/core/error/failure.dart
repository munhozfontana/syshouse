import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
}

class ServerFailure extends Failure {
  final String menssagem;

  ServerFailure({this.menssagem});

  @override
  List<Object> get props => [menssagem];

  @override
  String get message => menssagem;
}

class InvalidValuesFailure extends Failure {
  final String menssagem;

  InvalidValuesFailure({this.menssagem});

  @override
  List<Object> get props => [menssagem];
  @override
  String get message => menssagem;
}

class ValueNullFailure extends Failure {
  final String menssagem;

  ValueNullFailure({this.menssagem});

  @override
  List<Object> get props => [menssagem];
  @override
  String get message => menssagem;
}
