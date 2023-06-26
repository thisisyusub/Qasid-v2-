import 'package:equatable/equatable.dart';

import '../error/failure.dart';

sealed class DataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DataInitial extends DataState {}

class DataInProgress extends DataState {}

class DataSuccess<T> extends DataState {
  DataSuccess([this.data]);

  final T? data;

  @override
  List<Object?> get props => [data];
}

class DataFailure<E> extends DataState {
  DataFailure([this.failure]);

  final Failure<E>? failure;

  @override
  List<Object?> get props => [failure];
}
