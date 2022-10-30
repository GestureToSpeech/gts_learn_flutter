import 'dart:io';

abstract class VideoRepository {
  Future<void> sendVideo(String video);
}
