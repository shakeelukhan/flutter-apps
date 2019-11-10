import 'package:rishtaaunty/data/data.dart' as d;

abstract class BaseRepository<M extends d.BaseModel> {
  final String name;
  final bool cache;

  BaseRepository(this.name, {this.cache = true});

  Future<M> getData();
}
