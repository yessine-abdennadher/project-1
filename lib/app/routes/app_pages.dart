import 'package:get/get.dart';

import 'package:application/app/modules/details/bindings/details_binding.dart';
import 'package:application/app/modules/details/views/details_view.dart';
import 'package:application/app/modules/home/bindings/home_binding.dart';
import 'package:application/app/modules/home/views/home_view.dart';
import 'package:application/app/modules/library/bindings/library_binding.dart';
import 'package:application/app/modules/library/views/library_view.dart';
import 'package:application/app/modules/login/bindings/login_binding.dart';
import 'package:application/app/modules/login/views/login_view.dart';
import 'package:application/app/modules/register/bindings/register_binding.dart';
import 'package:application/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LIBRARY,
      page: () => LibraryView(),
      binding: LibraryBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(image: Get.arguments),
      binding: DetailsBinding(),
    ),
  ];
}
