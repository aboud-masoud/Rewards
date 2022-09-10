import 'package:logger/logger.dart';

final logger = Logger();

dynamic logDebugMessage({required String message}) {
  logger.d(message);
}

dynamic logErrorMessage({required String scopeName, required String customMessage, required dynamic error}) {
  logger.e(scopeName + " - " + customMessage, error);
}
