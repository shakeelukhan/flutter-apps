import 'package:flutter/material.dart';
import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/utils/utils.dart' as u;
import './app.dart';

void main() async {
  try {
    String assetString = await u.io.getAssetString('assets/config.json');
    Map assetMap = u.io.stringToJson(assetString);
    d.ConfigModel config = d.ConfigModel.fromJson(assetMap);
    Map json = config.sources['rishta_aunty_local'].toJson();
    print(d.ConfigSourceModel.fromJson(json));

    runApp(App.fromConfig('rishta_aunty_dev', local: true, cache: false));
  } catch (err) {
    u.log.logger.e(err);
  }
}
