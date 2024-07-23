import 'package:application/app/model/image_model.dart';
import 'package:application/app/modules/details/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  @override
  Widget build(BuildContext context) {
    final LibraryController libraryController = Get.find();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Positioned(
            left: 70,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: Text(
                  "Library",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 60,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(98, 97, 97, 0.474),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(10),
                  ),
                  shape: MaterialStateProperty.all(
                    CircleBorder(),
                  ),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(234, 181, 178, 178),
                  size: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 10, right: 11),
            child: Obx(() {
              if (libraryController.favoriteImages.isEmpty) {
                return Center(child: Text('Aucune image trouvée'));
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 13,
                  mainAxisSpacing: 13,
                ),
                itemCount: libraryController.favoriteImages.length,
                itemBuilder: (BuildContext context, int index) {
                  ImageModel image = libraryController.favoriteImages[index];

                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailsView(image: image));
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(185, 184, 184, 184),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    image.previewURL,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    image.user,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 247, 247, 247),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: image.isFavorite.value
                                  ? Colors.red
                                  : const Color.fromARGB(138, 137, 136, 136),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Icon(
                              image.isFavorite.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
