import 'dart:io';

import 'package:gts_learn/domain/base/base_use_case.dart';
import 'package:gts_learn/domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendVideoUseCase extends BaseUseCase<void, String> {
  SendVideoUseCase(this._repository);

  final VideoRepository _repository;

  @override
  Future<void> call(String param) => _repository.sendVideo(param);
}
