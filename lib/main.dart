import 'package:flutter/material.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/repositories/repositories.dart' as r;
import 'package:rishtaaunty/utils/utils.dart' as u;
import 'package:rishtaaunty/widgets/widgets.dart' as w;

void main() async {
  r.BaseRepository rApp;
  b.WidgetBloc bApp;
  Widget wApp;

  try {
    u.LogUtils.setSimplePrinter();
    u.LogUtils.setLoggerLevelWarning();

    rApp = r.AssetRepository<m.AppWidgetModel>(
        assetKey: r.defaultAssetKey, jsonKey: r.defaultAppJsonKey);
    bApp = b.WidgetBloc<m.AppWidgetModel>(repository: rApp);
    wApp = w.AppWidget(appData: await rApp.data);
    m.AppWidgetModel data = await rApp.data;
    print(data.runtimeType);
    print(data);

    runApp(bApp.getWidget(wApp));
  } catch (err) {
    u.LogUtils.logger.e(err.toString());
  }
}
