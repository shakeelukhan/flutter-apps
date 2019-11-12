import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:rishtaaunty/data/data.dart';
import 'package:rishtaaunty/utils/utils.dart' as u;
import './app.dart';

void main() async {
  try {
    String assetString = await u.io.getAssetString('assets/config.json');
    Map json = u.io.stringToJson(assetString);
    Map json2b = json['appDatasources']['rishta_aunty_cloud'];
    print(json2b);
 //   RemoteConfigDatasource abc = RemoteConfigDatasource((b)=>b..key='a'..cache=true);
 //   print(abc);
 //   print(serializers.deserialize(json2b));
  //  print(u.io.deserialize(json2b,FullType(RemoteConfigDatasource)));
  //  print(RemoteConfigDatasource.fromJson(json['appDatasources'][0]));
    print(u.io.deserialize(json, FullType(ConfigModel)));

    runApp(App.fromConfig('rishta_aunty_local'));
  } catch (err) {
    u.log.logger.e(err);
  }
}
