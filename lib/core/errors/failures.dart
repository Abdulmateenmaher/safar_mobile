import 'package:equatable/equatable.dart';

/// Base Failure Class
abstract class Failure extends Equatable {
  final String message;
  final int? statusCode;

  const Failure({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}

/// Server Failure
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server error occurred',
    super.statusCode,
  });
}

/// Network Failure
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection',
  });
}

/// Cache Failure
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error occurred',
  });
}

/// Authentication Failure
class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication failed',
    super.statusCode,
  });
}

/// Validation Failure
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
  });
}

/// Not Found Failure
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'Resource not found',
    super.statusCode = 404,
  });
}

/// Unknown Failure
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unknown error occurred',
  });
}
