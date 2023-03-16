// ignore_for_file: non_constant_identifier_names

import 'package:dxn/test.dart';
import 'package:get/get.dart';

import '../ad_item.dart';
import '../screens/home_screen/home_binding.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/invoices_screens/invoice_preview/invoice_preview_screen.dart';
import '../screens/invoices_screens/new_invoice_screen/new_invoice_binding.dart';
import '../screens/invoices_screens/new_invoice_screen/new_invoice_screen.dart';
import '../screens/invoices_screens/new_invoice_screen/new_items/items_binding.dart';
import '../screens/invoices_screens/new_invoice_screen/new_user/new_user_information.dart';
import '../screens/splash_screen/splash_screen.dart';
import 'links.dart';

class AppRouting {
  static final ROUTES = [
    GetPage(
      name: AppLinks.SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: AppLinks.HOME,
        page: () => const HomeScreen(),
        transition: Transition.circularReveal,
        binding: HomeBinding()),
    GetPage(
      name: AppLinks.NEW_INVOICE,
      page: () => const NewInvoiceScreen(),
      transition: Transition.fadeIn,
      binding: NewInvoiceBinding(),
    ),
    GetPage(
      name: AppLinks.NEW_BUSINESS,
      page: () => const NewBusinessScreen(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: AppLinks.NEW_ITEM,
      page: () => adminpage(),
      transition: Transition.rightToLeftWithFade,
      binding: ItemsBidning(),
    ),
    GetPage(
      name: AppLinks.PREVIEW,
      page: () => InvoicePreviewScreen(),
    ),
    // GetPage(
    //   name: AppLinks.TABLE,
    //   page: () => MyApp(),
    // ),
  ];
}
