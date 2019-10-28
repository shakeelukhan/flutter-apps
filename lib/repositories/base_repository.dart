part of './repositories.dart';

abstract class BaseRepository<T> {
  T _data;
  T get data => _data;
  Completer<T> _readCompleter;
  Completer<T> get readCompleter => _readCompleter;

  Future<T> read() async {
    if (_readCompleter?.isCompleted != false) {
      _readCompleter = Completer<T>();
       _readCompleter.complete(_data = await _read());
    }
    return _readCompleter.future;
  }

  Future<T> _read();
}
