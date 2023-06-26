import 'dart:async';

import '../either/either.dart';

abstract class AsyncUsecase<Error, Success, Params> {
  Future<Either<Error, Success>> call(Params params);
}
