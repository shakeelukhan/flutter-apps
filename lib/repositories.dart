import 'package:rishtaaunty/models.dart';
import './repositories/base_repository.dart';
import './repositories/asset_repository.dart';
import './repositories/firebase_repository.dart';
export './repositories/base_repository.dart';
export './repositories/asset_repository.dart';
export './repositories/firebase_repository.dart';

class R {
  R._();

  static BaseRepository get defaultAssetAppRepository =>
      assetRepository<AppModel>('assets/app.json', 'app');

  static BaseRepository get defaultFirebaseAppRepository =>
      firebaseRepository<AppModel>('rishtaaunty_dev', 'app');

  static assetRepository<T>(String assetKey, [String jsonKey]) =>
      AssetRepository<T>(assetKey: assetKey, jsonKey: jsonKey);

  static firebaseRepository<T>(String remoteConfigKey, [String jsonKey]) =>
      FirebaseRepository<T>(remoteConfigKey: remoteConfigKey, jsonKey: jsonKey);
}
