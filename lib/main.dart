import 'package:flutter/material.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/utils/utils.dart' as u;
import './app.dart';

void main() async {
  try {
    String assetString = await u.io.getAssetString('assets/apps.json');
    Map assetMap = u.io.stringToJson(assetString);
    d.AppSourcesModel apps = d.AppSourcesModel.fromJson(assetMap);
    print(apps);
    print(apps.sources['rishta_aunty_local']);

    runApp(App.fromConfig('rishtaaunty_dev', local: true, cache: false));
  } catch (err) {
    u.log.logger.e(err);
  }
}
