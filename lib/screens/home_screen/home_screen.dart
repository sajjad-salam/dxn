import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_invoice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/strings.dart';
import '../../controllers/invoices_controller.dart';
import '../shared_widgets/appbar_eng_view.dart';

class HomeScreen extends GetView<AllInvoiceController> {
  const HomeScreen({required this.sys});
  final int sys;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 182, 166),
      appBar: AppBar_eng(
        title: AppStrings.HOME_TITLE,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 124, 107, 88),
                elevation: 0,
              ),
              child: Stack(
                children: const [
                  Text(
                    'اضافة وصل جديد',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "myfont",
                        fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                // Get.toNamed("/new");
                Navigator.push(
                  context,
                  CupertinoPageRoute<Widget>(
                    builder: (BuildContext context) {
                      return NewInvoiceScreen(
                        system: sys,
                      );
                    },
                  ),
                );
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 124, 107, 88),
                elevation: 0,
              ),
              child: Stack(
                children: const [
                  Text(
                    'رجوع',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: "myfont",
                        fontSize: 18),
                  ),
                ],
              ),
              onPressed: () {
                // Navigator.pushNamed(context);
                Get.toNamed("/");
              },
            ),
          ],
        ),
      ),
    );
  }
}
