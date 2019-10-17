import 'package:logger/logger.dart';

class LoggerUtils {
  LoggerUtils._();
  static final LoggerUtils _loggerUtils = LoggerUtils._();
  factory LoggerUtils() => _loggerUtils;

  static Logger _logger = Logger(printer: PrettyPrinter(methodCount: 8));
//  static Logger _logger = Logger(printer: PrettyPrinter());
  static get logger => _logger;

  static setLoggerLevelError() => Logger.level = Level.error;
  static setLoggerLevelWarning() => Logger.level = Level.warning;
  static setLoggerLevelInfo() => Logger.level = Level.info;
}
