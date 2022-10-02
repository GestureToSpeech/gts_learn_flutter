import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

CameraController? useCameraController({
  required CameraDescription camera,
  required ResolutionPreset resolution,
  required ImageFormatGroup format,
}) =>
    use(
      _CameraControllerHook(
        camera: camera,
        resolution: resolution,
        format: format,
      ),
    );

class _CameraControllerHook extends Hook<CameraController?> {
  const _CameraControllerHook({
    required this.camera,
    required this.resolution,
    required this.format,
  });

  final CameraDescription camera;
  final ResolutionPreset resolution;
  final ImageFormatGroup format;

  @override
  _CameraControllerHookState createState() => _CameraControllerHookState(
        camera: camera,
        resolution: resolution,
        format: format,
      );
}

class _CameraControllerHookState
    extends HookState<CameraController?, _CameraControllerHook>
    with WidgetsBindingObserver {
  _CameraControllerHookState({
    required this.camera,
    required this.resolution,
    required this.format,
  });

  CameraController? _cameraController;
  final CameraDescription camera;
  final ResolutionPreset resolution;
  final ImageFormatGroup format;

  Future<void> initCamera() async {
    _cameraController = CameraController(
      camera,
      resolution,
      imageFormatGroup: format,
    );
    await _cameraController!.initialize().whenComplete(() => setState(() {}));
  }

  @override
  void initHook() {
    super.initHook();
    WidgetsBinding.instance.addObserver(this);
    initCamera();
  }

  @override
  void didUpdateHook(_CameraControllerHook oldHook) {
    if (oldHook.camera != hook.camera ||
        oldHook.resolution != hook.resolution ||
        oldHook.format != hook.format) {
      initCamera();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  CameraController? build(BuildContext context) {
    return _cameraController;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null) return;
    if (!_cameraController!.value.isInitialized) return;

    if (state == AppLifecycleState.inactive) {
      _cameraController?.dispose();
    } else if (state == AppLifecycleState.resumed) {
      initCamera();
    }
  }
}
