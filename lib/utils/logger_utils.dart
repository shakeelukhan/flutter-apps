import 'package:logger/logger.dart';

class LogUtils {
  LogUtils._();

  static Logger _logger = setPrettyPrinter();
  static get logger => _logger;

  static setLoggerLevelError() => Logger.level = Level.error;
  static setLoggerLevelWarning() => Logger.level = Level.warning;
  static setLoggerLevelInfo() => Logger.level = Level.info;

  static setSimplePrinter() => _logger = Logger(printer: SimplePrinter());
  static setPrettyPrinter() =>
      _logger = Logger(printer: PrettyPrinter(methodCount: 2));
}
