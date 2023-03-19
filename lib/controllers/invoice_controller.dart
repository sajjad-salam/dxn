// ignore_for_file: non_constant_identifier_names
import 'package:get/get.dart';
import '../models/business_model.dart';
import '../models/invoice_model.dart';
import '../models/item_model.dart';
import '../utils/functions.dart';

class InvoiceController extends GetxController {
  String id = "0";
  Business? business;
  RxList<Item> itemsList = <Item>[].obs;

  void setBusiness(Business val) async {
    business = val;
    await Future.delayed(const Duration(milliseconds: 20), () {
      update();
    });
  }

  void setItems(List<Item> val) async {
    itemsList.addAll(val);
    await Future.delayed(
      const Duration(milliseconds: 20),
      () {
        update();
      },
    );
  }

  void setPaymentInstructions(String val) async {
    await Future.delayed(
      const Duration(milliseconds: 20),
      () {
        update();
      },
    );
  }

  Invoice generate_preview_invoice() => Invoice(
        date: Functions.formatDate(DateTime.now()),
        from: business!,
        items: itemsList,
        total: itemsList.fold(
            0,
            (previousValue, next) =>
                previousValue + (double.parse(next.price))),
      );
  @override
  void onClose() {
    id = "0";
    business = null;
    itemsList.value = [];
    super.onClose();
  }
}
