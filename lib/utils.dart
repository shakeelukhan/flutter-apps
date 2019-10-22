import 'utils/firebase_utils.dart';
import 'utils/json_utils.dart';
import 'utils/logger_utils.dart';
import 'utils/serializer_utils.dart';

class U {
  U._();
  static final FirebaseUtils firebase = FirebaseUtils();
  static final JsonUtils json = JsonUtils();
  static final LogUtils log = LogUtils();
  static final SerializerUtils serializer = SerializerUtils();
}
