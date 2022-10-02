abstract class IsolateManager {
  Future<void> initIsolate(Object? Function() callback);

  Future<void> sendDataForIsolate(Object? data);

  Future<void> killIsolate();
}
