import 'dart:convert';
import 'package:application/app/model/image_model.dart';
import 'package:http/http.dart'
    as http; // Assurez-vous que le chemin est correct

class ImageService {
  static Future<List<ImageModel>> fetchImages() async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=23839781-aabf31afc5521ef394b0da263&q=gateau&image_type=photo'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['hits'];
      return jsonResponse.map((data) => ImageModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
