import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

sealed class Either<E, S> extends Equatable {
  @override
  List<Object?> get props => [];
}

final class Left<E, S> extends Either<E, S> {
  Left(this.error);

  final E? error;

  @override
  List<Object?> get props => [error];
}

final class Right<E, S> extends Either<E, S> {
  Right(this.success);

  final S? success;

  @override
  List<Object?> get props => [success];
}

@immutable
class Unit extends Equatable {
  const Unit._internal();

  @override
  String toString() => '()';

  @override
  List<Object?> get props => [];
}

const Unit unit = Unit._internal();
