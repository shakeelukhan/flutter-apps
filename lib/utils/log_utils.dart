import 'package:logger/logger.dart';

final LogUtils logUtils = LogUtils();

class LogUtils {
  Logger _logger;
  Logger get logger => _logger;

  LogUtils({Logger logger, Level level}) {
    _logger = logger ?? setLoggerPretty();
    Logger.level = level ?? setLoggerLevelWarning();
  }

  Logger setLoggerPretty() => _logger =
      Logger(printer: PrettyPrinter(errorMethodCount: 8, methodCount: 2));
  Logger setLoggerSimple() => _logger = Logger(printer: SimplePrinter());

  Level setLoggerLevelError() => Logger.level = Level.error;
  Level setLoggerLevelInfo() => Logger.level = Level.info;
  Level setLoggerLevelWarning() => Logger.level = Level.warning;
}
