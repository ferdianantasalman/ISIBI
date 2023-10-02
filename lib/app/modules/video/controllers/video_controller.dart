import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  TextEditingController textEditingController = TextEditingController();
  ChewieController? chewieController;

  var data = "Aku".obs;

  // final List<Map<String, dynamic>> allVideos = [
  //   {"url": "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/Aku.webm"},
  //   {"url": "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/Akur.webm"},
  //   {"url": "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/Akuarium.webm"},
  // ];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // checkhData();
    initializedPlayer();
    // textEditingController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController?.dispose();
    textEditingController.dispose();
  }

  void increment() => count.value++;

  Future<void> initializedPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
        "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/${data.value}.webm"));

    await Future.wait([videoPlayerController.initialize()]);

    // await videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
        aspectRatio: 16 / 9,
        materialProgressColors: ChewieProgressColors(
            playedColor: Colors.lightBlue,
            handleColor: Colors.blue,
            backgroundColor: Colors.white,
            bufferedColor: Colors.grey),
        // placeholder: Container(
        //   height: 50,
        //   width: 50,
        // ),
        // AspectRatio(
        //   aspectRatio: videoPlayerController.value.aspectRatio,
        //   child: VideoPlayer(videoPlayerController),
        // ),
        autoInitialize: true);
    update();
  }

  checkhData() {
    if (data.value.isEmpty) {
      data.value = "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/Aku.webm";
    } else if (data.value.isNotEmpty) {
      data.value =
          "https://pmpk.kemdikbud.go.id/sibi/SIBI/katadasar/${data.value}.webm";
    }

    print(data.value);
  }
}
