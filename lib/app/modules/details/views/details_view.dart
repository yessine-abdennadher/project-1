import 'package:application/app/model/image_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  final ImageModel image;

  DetailsView({required this.image});

  // Extract tags from the image
  List<String> _extractTags(String tags) {
    return tags.split(',').map((tag) => tag.trim()).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> tags = _extractTags(image.tags);

    return Scaffold(
      backgroundColor: Colors.black,
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
                  image.tags,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
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
          Positioned(
            top: 140,
            left: 12,
            child: Container(
              decoration: BoxDecoration(
                color: image.isFavorite.value
                    ? Colors.red // Marquer les images favorites en rouge
                    : Color.fromRGBO(184, 184, 184, 0.619),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 370,
              height: 450,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
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
                      padding: const EdgeInsets.all(11.0),
                      child: Text(
                        image.user,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 50,
            right: 50,
            child: Container(
              height: 75,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Obx(() {
                        return ElevatedButton(
                          onPressed: () {
                            // Get the controller and toggle the favorite status
                            controller.toggleFavorite(image);
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
                            image.isFavorite.value
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: Color.fromARGB(234, 181, 178, 178),
                            size: 25,
                          ),
                        );
                      }),
                      SizedBox(height: 3),
                      Obx(() => Text(
                        image.likes.value.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                          Icons.visibility,
                          color: Color.fromARGB(234, 181, 178, 178),
                          size: 25,
                        ),
                      ),
                      SizedBox(height: 5),
                      Obx(() => Text(
                        image.views.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                          Icons.download,
                          color: Color.fromARGB(234, 181, 178, 178),
                          size: 25,
                        ),
                      ),
                      SizedBox(height: 5),
                       Text(
                        image.downloads.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 11,
            child: Container(
              width: 390,
              height: 70,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color.fromRGBO(232, 17, 252, 1),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 15),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  "Button",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 250,
            left: 20,
            child: Container(
              width: 370,
              height: 50,
              child: tags.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (BuildContext context, int index) {
                  return Chip(
                    label: Text(
                      tags[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    backgroundColor: Color.fromARGB(176, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: Color.fromARGB(176, 0, 0, 0),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
