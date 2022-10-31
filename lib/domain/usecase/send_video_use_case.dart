import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendVideoUseCase extends BaseUseCase<List<double>, String> {
  SendVideoUseCase(this._repository);

  final VideoRepository _repository;

  @override
  Future<List<double>> call(String param) => _repository.sendVideo(param);
}
