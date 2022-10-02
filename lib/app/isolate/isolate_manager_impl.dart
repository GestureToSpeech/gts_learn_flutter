import 'dart:developer';
import 'dart:isolate';

import 'package:gts_learn/app/isolate/isolate_manager.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IsolateManager)
class IsolateManagerImpl implements IsolateManager {
  SendPort? _isolatePort;
  Isolate? _isolateInstance;
  SendPort? get isolatePort => _isolatePort;

  @override
  Future<void> initIsolate(Object? Function() callback) async {
    final receivePort = ReceivePort();
    _isolateInstance = await Isolate.spawn(
      (SendPort p) => _executeCallback(p, callback),
      receivePort.sendPort,
    );

    receivePort.listen((dynamic message) {
      if (message is SendPort) {
        _isolatePort = message;
        log('Isolate initialized!');
        return;
      }
    });
  }

  @override
  Future<void> sendDataForIsolate(Object? data) async {
    if (_isolatePort != null) {
      _isolatePort!.send(data);
    } else {
      log('Isolate is not initialized (did you use initIsolate() first?)');
    }
  }

  static Future<void> _executeCallback(
    SendPort mainPort,
    Object? Function() callback,
  ) async {
    final isolateReceivePort = ReceivePort()
      ..listen((dynamic data) {
        callback();
        log('callback invoked, message: $data');
      });

    mainPort.send(isolateReceivePort.sendPort);
  }

  @override
  Future<void> killIsolate() async {
    _isolateInstance?.kill(priority: Isolate.immediate);
    _isolateInstance = null;
  }
}
