import 'package:application/app/model/image_model.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController {
  // Reactive list to hold favorite images
  RxList<ImageModel> favoriteImages = <ImageModel>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}


  void toggleFavorite(ImageModel image) {
    if (favoriteImages.contains(image)) {
      favoriteImages.remove(image);
      print('Image retirée des favoris: ${image.id}');
    } else {
      favoriteImages.add(image);
      print('Image ajoutée aux favoris: ${image.id}');
    }
    print('Liste des favoris: ${favoriteImages.length}');
  }
}

  // Notifiez la vue bibliothèque pour qu'elle se mette à jour


