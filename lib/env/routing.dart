// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../screens/invoices_screens/new_invoice_screen/new_user/new_user_information.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'links.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: AppLinks.NEW_BUSINESS,
      page: () => NewBusinessScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
