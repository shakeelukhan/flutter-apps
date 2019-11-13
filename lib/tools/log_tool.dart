import 'package:logger/logger.dart';

class LogUtil {
  Logger _logger;
  Logger get logger => _logger;

  LogUtil({Logger logger, Level level}) {
    _logger = logger ?? setLoggerToPretty();
    Logger.level = level ?? setLevelToWarning();
  }

  Logger setLoggerToPretty() => _logger =
      Logger(printer: PrettyPrinter(errorMethodCount: 8, methodCount: 2));
  Logger setLoggerToSimple() => _logger = Logger(printer: SimplePrinter());

  Level setLevelToError() => Logger.level = Level.error;
  Level setLevelToInfo() => Logger.level = Level.info;
  Level setLevelToWarning() => Logger.level = Level.warning;
}

final LogUtil logUtil = LogUtil();
