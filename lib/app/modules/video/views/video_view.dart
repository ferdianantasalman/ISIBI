import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/video_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoView extends GetView<VideoController> {
  final videoC = Get.find<VideoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembelajaran'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: TextField(
                controller: videoC.textEditingController,
                onSubmitted: (value) {
                  videoC.data.value = videoC.textEditingController.text;
                  print(videoC.data.value);
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15),
                    hintText: "Seacrh",
                    suffixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide())),
              ),
            ),
            Obx(
              () => Text(
                'Bahasa Isyarat dari  ${videoC.data.value}',
                // 'Bahasa Isyarat dari ${videoC.data.value} ',
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GetBuilder<VideoController>(
                  init: VideoController(),
                  builder: (controller) {
                    return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: controller.chewieController != null &&
                              controller.chewieController!.videoPlayerController
                                  .value.isInitialized
                          ? Chewie(controller: controller.chewieController!)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircularProgressIndicator(),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Loading",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black, fontSize: 15),
                                )
                              ],
                            ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
