part 'server_exception_type.dart';


abstract class Failure {
  final ServerExceptionType type;
  final String message;
  final int? code;
  const Failure({
    required this.type,
    required this.message,
    this.code,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    required super.type,
    int? code,
  });
}

class CacheFailure extends Failure {
  const CacheFailure({
    required super.message,
    required super.type,
    int? code,
  });
}