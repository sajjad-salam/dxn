import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/business_model.dart';
import 'invoice_controller.dart';

class BusinessController extends GetxController {
  Business? business;
  TextEditingController businessNameInputController = TextEditingController();
  TextEditingController businessPhoneInputController = TextEditingController();
  TextEditingController businessAddressInputController =
      TextEditingController();

  // validate input => for information user
  bool validate() {
    if (businessNameInputController.text.isEmpty ||
        businessPhoneInputController.text.isEmpty ||
        businessAddressInputController.text.isEmpty) {
      Get.snackbar(
        "خطأ",
        "من فضلك املأ كل الحقول",
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } else {
      business = Business(
        name: businessNameInputController.text,
        address: businessAddressInputController.text,
        phone: businessPhoneInputController.text,
      );
      return true;
    }
  }

  @override
  void onClose() {
    if (business != null) {
      businessNameInputController.clear();
      businessPhoneInputController.clear();
      businessAddressInputController.clear();
      Get.find<InvoiceController>().setBusiness(business!);
    }
    super.onClose();
  }
}
