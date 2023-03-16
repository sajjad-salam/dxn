// import 'package:fatura_app/env/routing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'env/routing.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: "/",
      getPages: AppRouting.ROUTES,
    ),
  );
}
