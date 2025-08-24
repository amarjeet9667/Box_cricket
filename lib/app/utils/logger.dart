import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Number of method calls to show
      errorMethodCount: 8, // Number of method calls if stack trace is provided
      lineLength: 100, // Width of each log line
      colors: true, // Colorize output
      printEmojis: true, // Print emojis for log levels
      printTime: true, // Print time in logs
    ),
  );

  static void info(String message) {
    _logger.i(message);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}
