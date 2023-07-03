import 'package:dio/dio.dart';
import 'package:wallpapers/album.dart';

// bool _loading = false;
int offset = 0;
int time = 800;
final Dio _dio = Dio();


// List<PhotoList> _photos = [];



class ApiService {
  static Future fetchJson() async {
    int noOfImageToLoad = 300;
    String apiKEY = "563492ad6f917000010000012c86b620b42240f8928c3f44f2447e54";
    // _photos = [];

    var response = await _dio.get(
      "https://api.pexels.com/v1/curated?per_page=$noOfImageToLoad&page=1",
      options: Options(
        headers: {"Authorization": apiKEY},
      ),
    );

    // List<PhotoList> pList = [];
    if (response.statusCode == 200) {
      final data = response.data;
      // var urJson = json.decode(response.body);
      // data["photos"].forEach((element) async {
      //   pList.add(PhotoList.fromJson(element));
      // });
      Wallpaper wallpaper = Wallpaper.fromJson(data);
      return wallpaper;
    }
      return response.statusCode;
    }
}
