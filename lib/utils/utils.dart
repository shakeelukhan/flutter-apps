import './asset_utils.dart';
import './built_value_utils.dart';
import './firebase_utils.dart';
import './json_utils.dart';
import './log_utils.dart';
import './serializer_utils.dart';

final Utils u = Utils(
    assetUtils: assetUtils,
    builtValueUtils: builtValue,
    firebaseUtils: firebaseUtils,
    jsonUtils: jsonUtils,
    logUtils: logUtils,
    serializerUtils: serializerUtils);

class Utils {
  AssetUtils _assetUtils;
  BuiltValueUtils _builtValueUtils;
  FirebaseUtils _firebaseUtils;
  JsonUtils _jsonUtils;
  LogUtils _logUtils;
  SerializerUtils _serializerUtils;

  AssetUtils get asset => _assetUtils;
  BuiltValueUtils get builtValue => _builtValueUtils;
  FirebaseUtils get firebase => _firebaseUtils;
  JsonUtils get json => _jsonUtils;
  LogUtils get log => _logUtils;
  SerializerUtils get serializer => _serializerUtils;

  Utils(
      {AssetUtils assetUtils,
      BuiltValueUtils builtValueUtils,
      FirebaseUtils firebaseUtils,
      JsonUtils jsonUtils,
      LogUtils logUtils,
      SerializerUtils serializerUtils}) {
    _assetUtils = assetUtils ?? AssetUtils();
    _builtValueUtils = builtValueUtils ?? BuiltValueUtils();
    _firebaseUtils = firebaseUtils ?? FirebaseUtils();
    _jsonUtils = jsonUtils ?? JsonUtils();
    _logUtils = logUtils ?? LogUtils();
    _serializerUtils = serializerUtils ?? SerializerUtils();
  }
}
