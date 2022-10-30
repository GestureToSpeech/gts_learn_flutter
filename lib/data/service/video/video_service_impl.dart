import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gts_learn/data/service/video/video_service.dart';
import 'package:injectable/injectable.dart';

const String _sendVideoEndpoint =
    'http://192.168.0.143:8000/api/execution_videos/';

@Injectable(as: VideoService)
class VideoServiceImpl extends VideoService {
  @override
  Future<void> sendVideo(String video) async {
    final dio = Dio();
    print('dwdwd');
    final fileName = video.split('/').last;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(video, filename: fileName),
    });
    final response = await dio.post<void>(
      _sendVideoEndpoint,
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Token d1d9a02fee5b6f2a189171fc96b0b661b20ba559'
        },
      ),
    );
  }
}
