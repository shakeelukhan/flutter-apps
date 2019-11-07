import 'package:meta/meta.dart';
import '../models/base_model.dart';
import './app_repository.dart';
import './base_repository.dart';

abstract class PageRepository<M extends BaseModel> extends BaseRepository {
  final AppRepository repository;
  final String key;

  PageRepository.fromRepository({@required this.repository, @required this.key})
      : super(cache: false);

  Future<M> getData() async =>
      BaseModel.fromJson<M>((await repository.getData())[key]);
}
