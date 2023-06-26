import 'package:equatable/equatable.dart';

abstract class Params extends Equatable {
  const Params();

  @override
  List<Object?> get props => [];
}

class NoParams extends Params {}
