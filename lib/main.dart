import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/repositories/repositories.dart' as r;
import 'package:rishtaaunty/utils/utils.dart' as u;

void main() async {
  u.LogUtils.setSimplePrinter();
  u.LogUtils.setLoggerLevelWarning();

  try {
    r.BaseRepository appRepository = r.AssetRepository<m.AppWidgetModel>(
        assetKey: r.defaultAssetKey, jsonKey: r.defaultAppJsonKey);
    runApp(b.WidgetBloc<m.AppWidgetModel>(repository: appRepository)
        .getWidget(Text('abc')));
  } catch (err) {
    u.LogUtils.logger.e(err.toString());
  }
}
