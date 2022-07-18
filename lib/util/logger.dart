import 'package:logger/logger.dart';

class AppLogger {
  void logInfo(String message) {
    final Logger _logger = Logger();
    _logger.i(message);
  }

   void logError(String message) {
    final Logger _logger = Logger();
    _logger.e(message);
  }

   void logWarning(String message) {
    final Logger _logger = Logger();
    _logger.w(message);
  }

}
