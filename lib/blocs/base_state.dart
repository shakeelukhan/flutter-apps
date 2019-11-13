import 'package:rishtaaunty/data/data.dart' as d;
import 'package:rishtaaunty/tools/tools.dart' as t;

abstract class BaseState<M extends d.BaseModel> {}

class BaseStateNew<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateUpdating<M extends d.BaseModel> extends BaseState<M> {}

class BaseStateReady<M extends d.BaseModel> extends BaseState<M> {
  final M data;

  BaseStateReady(this.data);
}

class BaseStateError<M extends d.BaseModel> extends BaseState<M> {
  Exception error;

  BaseStateError(this.error) {
    t.log.logger.e('WidgetStateError: $error');
  }
}
