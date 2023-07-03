import 'package:get/get.dart';
import 'package:wallpapers/album.dart';
import 'package:wallpapers/services/album_api_service.dart';

class AlbumController extends GetxController {
  var isLoading = true.obs;
  var photoList = Wallpaper(photos: []).obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotoList();
  }

  void fetchPhotoList() async {
    try {
      isLoading(true);
      Wallpaper photos = await ApiService.fetchJson();
      if (photos.photos.isNotEmpty) {
        photoList.value = photos;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}
