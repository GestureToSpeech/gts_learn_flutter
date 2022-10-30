import 'dart:io';

abstract class VideoService {
  Future<void> sendVideo(String video);
}
