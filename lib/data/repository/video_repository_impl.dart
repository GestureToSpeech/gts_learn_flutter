import 'dart:io';

import 'package:gts_learn/data/service/video/video_service.dart';
import 'package:gts_learn/domain/repository/video_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VideoRepository)
class VideoRepositoryImpl extends VideoRepository {
  VideoRepositoryImpl(this._service);

  final VideoService _service;

  @override
  Future<void> sendVideo(String video) async {
    await _service.sendVideo(video);
  }
}
