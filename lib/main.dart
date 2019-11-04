import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rishtaaunty/blocs/blocs.dart' as b;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/pages/pages.dart' as p;
import 'package:rishtaaunty/repositories/repositories.dart' as r;
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/utils/utils.dart' as u;

void main() async {
  r.BaseRepository rAppL, rAppR;
  b.WidgetBloc bApp;
  Widget wApp;

  try {
    rAppL = r.AssetRepository<m.AppWidgetModel>(
        assetKey: r.defaultAssetKey, jsonKey: r.defaultAppJsonKey);
    /*  rAppR = r.FirebaseRepository<m.AppWidgetModel>(
        remoteConfigKey: r.defaultRemoteConfigKey,
        jsonKey: r.defaultAppJsonKey);*/
    /*   bApp = b.WidgetBloc<m.AppWidgetModel>(repository: rAppL);
    await rAppL.read();
    wApp = p.AppPage(data: rAppL.data);

    runApp(bApp.getWidget(wApp)); */
/*
    r.BaseRepository rApp2;
    rApp2 = r.BaseRepository<m.AppWidgetModel>(
        sourceKey: r.defaultAssetKey, jsonKey: 'app');
    m.BaseWidgetModel dataMap = await rApp2.read();
    //print(dataMap);
*/
    d.AppRepository appRepository;
    appRepository = d.AppRepository(appName: 'rishtaaunty_dev');
    await appRepository.getData();
    print(appRepository.data['app']);
  } catch (err) {
    u.log.logger.e(err);
  }
}
