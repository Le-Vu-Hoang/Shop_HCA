enum FailureType {
  server,
  cache,
  network,
  auth,
}

abstract class Failure {
  final String message;
  final FailureType type;
  const Failure(this.message, this.type);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.type = FailureType.server]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.type = FailureType.cache]);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'No internet connection'])
      : super(message, FailureType.network);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.type = FailureType.auth]);
}