import 'dart:convert';

class IoUtil {
  dynamic stringToJson(String source) => jsonDecode(source);
  String jsonToString(Object object) => jsonEncode(object);
}

final IoUtil ioUtil = IoUtil();
