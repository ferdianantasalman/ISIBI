import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart';

class TranslatorController extends GetxController {
  late CameraController cameraController;

  late List<CameraDescription> cameras;

  late CameraImage cameraImage;

  // List<dynamic>? detector = [];

  var isCameraInitialized = false.obs;
  var cameraCount = 0;

  var x, y, w, h = 0.0;
  var label = "";

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initCamera();
    initTfLite();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
    cameraController.stopImageStream();
    // Tflite.close();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    cameraController.stopImageStream();
    Tflite.close();
  }

  initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();

      cameraController = CameraController(cameras[0], ResolutionPreset.max);

      await cameraController.initialize().then((value) {
        cameraController.startImageStream((image) {
          cameraCount++;

          if (cameraCount % 10 == 0) {
            cameraCount = 0;
            objectDetector(image);
          }
          update();
        });
      });
      isCameraInitialized(true);
      update();
    } else {
      print("Permission denied");
    }
  }

  initTfLite() async {
    // Tflite.close();
    await Tflite.loadModel(
      model: "assets/models/model.tflite",
      labels: "assets/models/labels.txt",
      isAsset: true,
      numThreads: 1,
      useGpuDelegate: false,
    );
    // useGpuDelegate: false
  }

  Future<void> objectDetector(CameraImage image) async {
    var detector = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((e) {
          return e.bytes;
        }).toList(),
        asynch: true,
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        numResultsPerClass: 1,
        rotation: 90,
        threshold: 0.4);

    if (detector != null) {
      // var result = detector?.map(
      //   (result) {
      //     label.value = result['label'];
      //     x = result['rect']['x'];
      //     y = result['rect']['y'];
      //     w = result['rect']['w'];
      //     h = result['rect']['h'];
      //   },
      // );
      // print("Result is ${detector}");
      // print(label.value);
      // label = detector['detectedClass'].toString();

      var ourDetectorObject = detector.first;

      if (ourDetectorObject['confidenceInClass'] * 100 > 45) {
        label = ourDetectorObject['detectedClass'].toString();
        x = ourDetectorObject['rect']['x'];
        y = ourDetectorObject['rect']['y'];
        w = ourDetectorObject['rect']['w'];
        h = ourDetectorObject['rect']['h'];
        print(label);
      }
      print("Result is ${detector}");
      update();
    }
  }

  // List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
  //   if (detector != null) {
  //     double factorX = screen.width;
  //     double factorY = screen.height;

  //     Color colorpick = Colors.green;

  //     return detector.map
  //   }
  // }
}
