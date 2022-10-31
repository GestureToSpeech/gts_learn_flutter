import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gts_learn/data/service/video/video_service.dart';
import 'package:injectable/injectable.dart';

const String _sendVideoEndpoint =
    'http://192.168.138.235:8080/predictions/gesture';

@Injectable(as: VideoService)
class VideoServiceImpl extends VideoService {
  @override
  Future<List<double>> sendVideo(String video) async {
    final dio = Dio();
    final fileName = video.split('/').last;
    final formData = FormData.fromMap({
      'body': await MultipartFile.fromFile(video, filename: fileName),
    });
    final response = await dio.post<String>(
      _sendVideoEndpoint,
      data: formData,
    );

    final decodedResponse = jsonDecode(response.data!) as List<dynamic>;

    return Future.value(
      decodedResponse.map((e) => e as double).toList(),
    );
  }
}
