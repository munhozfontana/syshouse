import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String menssagem;

  ServerFailure({this.menssagem});

  @override
  List<Object> get props => [menssagem];
}

class InvalidValuesFailure extends Failure {
  final String menssagem;

  InvalidValuesFailure({this.menssagem});

  @override
  List<Object> get props => [menssagem];
}
