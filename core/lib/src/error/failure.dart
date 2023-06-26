import 'package:equatable/equatable.dart';

enum ErrorType {
  internet,
  internalServer,
  badRequest,
  notFound,
  unauthorized,
  cache,
  other
}

class Failure<E> extends Equatable {
  final E? error;
  final ErrorType errorType;

  const Failure({
    this.errorType = ErrorType.other,
    this.error,
  });

  const Failure.cache() : this(errorType: ErrorType.cache);

  const Failure.unauthorized() : this(errorType: ErrorType.unauthorized);

  const Failure.notFound() : this(errorType: ErrorType.notFound);

  const Failure.noInternet() : this(errorType: ErrorType.internet);

  const Failure.internalServer([E? error])
      : this(
          errorType: ErrorType.internalServer,
          error: error,
        );

  const Failure.other([E? error])
      : this(
          errorType: ErrorType.other,
          error: error,
        );

  @override
  List<Object?> get props => <Object?>[errorType, error];
}
