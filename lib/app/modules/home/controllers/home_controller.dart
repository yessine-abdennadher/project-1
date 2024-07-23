import 'package:application/app/model/image_model.dart';
import 'package:application/app/services/image_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var images = <ImageModel>[].obs;
  var tags = <String>[].obs;
  var selectedTags = <String>[].obs;

  @override
  void onInit() {
    fetchImages();
    super.onInit();
  }

  void fetchImages() async {
    var fetchedImages = await ImageService.fetchImages();
    images.assignAll(fetchedImages);
    tags.assignAll(_extractTags(fetchedImages));
  }

  void toggleFavorite(ImageModel image) {
    image.isFavorite.value= !image.isFavorite.value;

  }

  List<String> _extractTags(List<ImageModel> images) {
    return images.expand((image) => image.tags.split(', ')).toSet().toList();
  }

  List<ImageModel> get filteredImages {
    if (selectedTags.isEmpty) {
      return images;
    }
    return images.where((image) {
      final imageTags = image.tags.split(', ');
      return selectedTags.any((tag) => imageTags.contains(tag));
    }).toList();
  }
}
