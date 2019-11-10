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

    d.AppSourcesModel apps1 = d.AppSourcesModel.fromJson(
        u.io.stringToJson(await u.io.getAssetString('assets/apps.json')));
    print(apps1);
    d.AppSourcesModel apps2 = d.AppSourcesModel.fromJson(
        u.io.stringToJson(await u.io.getAssetString('assets/apps2.json')));
    print(apps2);

    print(apps1 == apps1);
    print(apps1 == apps2);

    runApp(App.fromConfig('rishta_aunty_dev', local: true, cache: false));
  } catch (err) {
    u.log.logger.e(err);
  }
}
