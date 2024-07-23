import 'package:application/app/model/image_model.dart';
import 'package:application/app/modules/details/views/details_view.dart';
import 'package:application/app/modules/library/controllers/library_controller.dart';
import 'package:application/app/modules/library/views/library_view.dart';
import 'package:application/app/shared/textfFiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController imageController = Get.put(HomeController());
  final LibraryController favoriteImages = Get.put(LibraryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, John!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Explore tons of images",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const MyTextField(
                  isPassword: false,
                  type: TextInputType.text,
                  hintText: "Search...",
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Tags",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Define the action to be performed when the button is pressed
                          print('See All button pressed!');
                        },
                        child: const Text(
                          "See All >",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (imageController.tags.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    width: double.infinity,
                    height: 50,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageController.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        final tag = imageController.tags[index];
                        final isSelected =
                        imageController.selectedTags.contains(tag);
                        return GestureDetector(
                          onTap: () {
                            if (isSelected) {
                              imageController.selectedTags.remove(tag);
                            } else {
                              imageController.selectedTags.add(tag);
                            }
                          },
                          child: Chip(
                            label: Text(
                              tag,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            backgroundColor: isSelected
                                ? const Color.fromRGBO(232, 17, 252, 1)
                                : const Color.fromARGB(210, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: const BorderSide(
                                color: Color.fromARGB(176, 0, 0, 0),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                      const SizedBox(width: 10),
                    ),
                  );
                }),
                const SizedBox(height: 10), // Reduced the height here
                Expanded(
                  child: Obx(() {
                    if (imageController.images.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    List<ImageModel> filteredImages =
                        imageController.filteredImages;
                    if (filteredImages.isEmpty) {
                      return const Center(child: Text('No images found'));
                    }
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2 / 3,
                        crossAxisSpacing: 13,
                        mainAxisSpacing: 13,
                      ),
                      itemCount: filteredImages.length,
                      itemBuilder: (BuildContext context, int index) {
                        ImageModel image = filteredImages[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailsView(image: image));
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: image.isFavorite.value
                                      ? Colors.red
                                      : const Color.fromARGB(185, 184, 184, 184),
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
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          image.user,
                                          style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 247, 247, 247),
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
                                child: GestureDetector(
                                  onTap: () {
                                    imageController.toggleFavorite(image);
                                  },
                                  child: Obx(() {
                                    return Container(
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
                                    );
                                  }),
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
          ),
          Positioned(
            top: 60,
            right: 20,
            child: Container(
              width: 170,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 20, top: 5),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LibraryView());
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(232, 17, 252, 1),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.local_activity, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Library",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
