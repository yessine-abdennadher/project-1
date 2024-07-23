// ignore_for_file: unused_import, prefer_const_constructors

import 'package:application/app/routes/app_pages.dart';

 import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Importez le service de récupération des images
// Importez le modèle

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Named Routes Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
