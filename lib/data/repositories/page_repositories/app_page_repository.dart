import 'package:meta/meta.dart';
import '../../models/page_models/app_page_model.dart';
import '../app_repository.dart';
import '../page_repository.dart';

class AppPageRepository extends PageRepository<AppPageModel> {
  AppPageRepository.fromRepository({@required AppRepository repository})
      : super.fromRepository(repository: repository, key: 'app');
}
