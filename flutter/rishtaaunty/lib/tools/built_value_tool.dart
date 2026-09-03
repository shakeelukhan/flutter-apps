import 'package:built_value/serializer.dart';
import 'package:rishtaaunty/data/data.dart' as d;

// Originally also had getStringCode()/getAssetCode()/printAssetCode()
// dev-tooling helpers (via package:json2builtvalue) for generating
// built_value model source from sample JSON -- unused by the app itself
// (nothing ever called them) and removed along with that dependency.
class BuiltValueUtil {
  Object? deserialize(Object serialized,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.deserialize(serialized, specifiedType: specifiedType);

  Object? serialize(Object object,
          [FullType specifiedType = FullType.unspecified]) =>
      d.serializers.serialize(object, specifiedType: specifiedType);
}

final BuiltValueUtil builtValueUtil = BuiltValueUtil();
