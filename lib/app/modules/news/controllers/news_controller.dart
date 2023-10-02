import 'dart:convert';

import 'package:get/get.dart';
// import 'package:isibi/app/data/models/detail_news.dart';
import 'package:isibi/app/data/service/news_service.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  // RxString searchValue = "".obs;
  var data = [].obs;
  // var news = [].obs;

  // final List<Map<String, dynamic>> allPlayers = [
  //   {
  //     "id": 1,
  //     "name": "Dr. Manu Kumar",
  //     "des": "Co-founder & CEO @ ",
  //     "image":
  //         "https://im.rediff.com/300-300/movies/2019/oct/14neeraj-madhav2.jpg",
  //   },
  //   {
  //     "id": 2,
  //     "name": "BL Kumawat",
  //     "des": "Co-founder & CEO @ ",
  //     "image":
  //         "https://upload.wikimedia.org/wikipedia/en/4/47/Iron_Man_%28circa_2018%29.png",
  //   },
  //   {
  //     "id": 3,
  //     "name": "Rohit Kumar",
  //     "des": "Co-founder & CEO @ ",
  //     "image":
  //         "https://sa1s3optim.patientpop.com/assets/images/provider/photos/1888657.jpg",
  //   },
  //   {
  //     "id": 4,
  //     "name": "Mitesh Raj",
  //     "des": "Co-founder & CEO @ ",
  //     "image":
  //         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_LmG47_W3RM0QBVGI23-vodL_oOOJxLIBrg&usqp=CAU",
  //   },
  //   {
  //     "id": 5,
  //     "name": "Dr. Manu Kumar",
  //     "des": "Co-founder & CEO @ ",
  //     "image":
  //         "https://img.freepik.com/free-photo/black-man-city_1157-17027.jpg?w=2000",
  //   }
  // ];

  // Rx<List<Map<String, dynamic>>> foundPlayers =
  //     Rx<List<Map<String, dynamic>>>([]);

  // void changeValue(String value) async {
  //   searchValue.value = value;
  // }

  @override
  void onInit() {
    super.onInit();
    // foundPlayers.value = allPlayers;
    _fetchNews();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    // void filterPlayer(String playerName) {
    //   List<Map<String, dynamic>> results = [];
    //   if (playerName.isEmpty) {
    //     results = allPlayers;
    //   } else {
    //     results = allPlayers
    //         .where((element) => element["name"]
    //             .toString()
    //             .toLowerCase()
    //             .contains(playerName.toLowerCase()))
    //         .toList();
    //   }
    //   foundPlayers.value = results;
    // }
  }

  Future _fetchNews() async {
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=de89bb11687b4c3b9ebeecdf17bf0056");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final ready = json.decode(response.body)['articles'];

      // print(ready);
      data.addAll(ready);
      print(data);
    } else {
      throw Exception('Failed to load news');
    }

    // news.assignAll(data.map((item) => DetailNews.fromJson(item)).toList());
  }
}
