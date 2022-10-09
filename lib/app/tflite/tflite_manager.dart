import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart' as tflh;

const modelPath = 'assets/models/model.tflite';
const imageSize = 224;

@injectable
class TFLiteManager {
  late tfl.Interpreter _interpreter;
  late tflh.ImageProcessor _imageProcessor;

  tfl.Interpreter get interpreter => _interpreter;

  Future<void> initInterpreter() async {
    final gpuDelegate = tfl.GpuDelegateV2(
      options: tfl.GpuDelegateOptionsV2(),
    );

    final options = tfl.InterpreterOptions()..addDelegate(gpuDelegate);
    _interpreter = await tfl.Interpreter.fromAsset(modelPath, options: options);
  }

  Future<void> initImageProcessor() async {
    _imageProcessor = tflh.ImageProcessorBuilder()
        .add(
          tflh.ResizeOp(
            imageSize,
            imageSize,
            tflh.ResizeMethod.NEAREST_NEIGHBOUR,
          ),
        )
        .build();
  }

  Future<tflh.TensorImage> getProcessedImage(File image) async =>
      _imageProcessor.process(tflh.TensorImage.fromFile(image));

  Future<tflh.TensorBuffer> getOutputBuffer() async =>
      tflh.TensorBuffer.createFixedSize(<int>[1, 15], tfl.TfLiteType.uint8);

  Future<void> runModel(
    tflh.TensorImage image,
    tflh.TensorBuffer outputBuffer,
  ) async {}
}
