import 'package:get/get.dart';

class ImageModel {
  final String id;
  final String previewURL;
  final String user;
  final String tags;
  final RxInt likes;
  final int downloads;
  final RxBool isFavorite;
  final RxInt views;

  ImageModel({
    required this.id,
    required this.previewURL,
    required this.user,
    required this.tags,
    required int likes,
    required this.downloads,
    required int views,
    bool isFavorite = false,
  })  : likes = likes.obs, // Wrap likes with .obs
        isFavorite = isFavorite.obs,
        views = views.obs; // Wrap views with .obs

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'].toString(),
      previewURL: json['previewURL'].toString(),
      user: json['user'].toString(),
      tags: json['tags'].toString(),
      likes: json['likes'] is int ? json['likes'] : int.parse(json['likes']),
      downloads: json['downloads'] is int
          ? json['downloads']
          : int.parse(json['downloads']),
      views: json['views'] is int ? json['views'] : int.parse(json['views']),
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'previewURL': previewURL,
      'user': user,
      'tags': tags,
      'likes': likes.value, // Use the value of RxInt
      'downloads': downloads,
      'views': views.value, // Use the value of RxInt
      'isFavorite': isFavorite.value, // Use the value of RxBool
    };
  }
}
