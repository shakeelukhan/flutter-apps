import 'package:rishtaaunty/data/data.dart' as d;

abstract class BaseEvent<M extends d.BaseModel> {}

class BaseEventUpdate<M extends d.BaseModel> extends BaseEvent<M> {
  final Future<M> data;
  BaseEventUpdate(this.data);
}
