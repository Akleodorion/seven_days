import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class LocalDataBaseFailure extends Failure {
  final String errorMessage;

  const LocalDataBaseFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final String errorMessage;

  const ServerFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
