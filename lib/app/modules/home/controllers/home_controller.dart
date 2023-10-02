import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt current = 0.obs;

  final List<String> imgList = [
    'assets/images/foto1.webp',
    'assets/images/foto2.webp',
    'assets/images/foto3.webp',
    'assets/images/foto4.webp',
    'assets/images/foto5.webp',
    'assets/images/foto6.webp'
  ];

  void changeIndex(int index) async {
    current.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
