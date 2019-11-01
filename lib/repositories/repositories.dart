import 'dart:async';
import 'dart:convert';
import 'package:built_value/serializer.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:rishtaaunty/clients/clients.dart' as c;
import 'package:rishtaaunty/models/models.dart' as m;
import 'package:rishtaaunty/utils/utils.dart' as u;

import './base_repository.dart';

part './asset_repository.dart';
part './base_repository.old.dart';
part './repository.dart';
part './firebase_repository.dart';

const defaultAssetKey = 'assets/rishtaaunty_dev.json';
const defaultRemoteConfigKey = 'rishtaaunty_dev';
const defaultAppJsonKey = 'app';
