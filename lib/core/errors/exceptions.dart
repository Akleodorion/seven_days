class LocalDatabaseException implements Exception {
  final String errorMessage;

  LocalDatabaseException({required this.errorMessage});
}

class ServerException implements Exception {
  final String errorMessage;
  
  ServerException({required this.errorMessage});
}
