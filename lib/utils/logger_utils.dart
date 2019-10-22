import 'package:logger/logger.dart';

class LogUtils {
  LogUtils._() {
    _logger = setPrettyPrinter();
  }
  static final LogUtils _loggerUtils = LogUtils._();
  factory LogUtils() => _loggerUtils;

  Logger _logger;
  get logger => _logger = _logger ?? setPrettyPrinter();

  setLoggerLevelError() => Logger.level = Level.error;
  setLoggerLevelWarning() => Logger.level = Level.warning;
  setLoggerLevelInfo() => Logger.level = Level.info;

  setSimplePrinter() => _logger = Logger(printer: SimplePrinter());
  setPrettyPrinter() =>
      _logger = Logger(printer: PrettyPrinter(methodCount: 2));
}
