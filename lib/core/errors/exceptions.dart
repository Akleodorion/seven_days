class LocalDatabaseException implements Exception {
  final String errorMessage;

  LocalDatabaseException({required this.errorMessage});
}
