import 'package:application/app/model/image_model.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  //TODO: Implémenter DetailsController
  final DetailsController imageController = Get.find<DetailsController>();
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

  void increment() => count.value++;

  void toggleFavorite(ImageModel image) {
    image.isFavorite.value = !image.isFavorite.value;
  }



  void toggleLike(ImageModel image) {
    if (image.isFavorite.value) {
      image.likes.value--;
    } else {
      image.likes.value++;
    }
    image.isFavorite.value = !image.isFavorite.value;
  }
}
