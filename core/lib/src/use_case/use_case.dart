import 'package:equatable/equatable.dart';

import '../either/either.dart';

abstract class Usecase<Error, Success, Params> {
  Either<Error, Success> call(Params params);
}
