import 'package:dartz/dartz.dart';

import '../error/failure.dart';

mixin UseCase<Type, Params> {
  Future<Either<Failure, Object>> call(Params params);
}
