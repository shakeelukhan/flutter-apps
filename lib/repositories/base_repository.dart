abstract class BaseRepository<T> {
  Future<T> get data;
  Future<T> read();
}
