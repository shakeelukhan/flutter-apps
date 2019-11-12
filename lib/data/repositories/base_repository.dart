import '../models/base_model.dart';

abstract class BaseRepository<M extends BaseModel> {
  final String name;

  BaseRepository(this.name);

  Future<M> getData();
}
