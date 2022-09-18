class DataLoadingFailure implements Exception {
  final String message;
  final String dataType;
  final String details;

  DataLoadingFailure(
      {required this.message, required this.dataType, required this.details});

  @override
  String toString() {
    return "$message{$dataType}: $details";
  }
}
