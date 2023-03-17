// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/item_model.dart';
import 'invoice_controller.dart';

class ItemsController extends GetxController {
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  TextEditingController itemnameInputController = TextEditingController();

  get itemsList => _itemsList;
  get total => _total;
  bool validate() {
    {
      add_item(
        item_point: (itempointInputController.text),
        item_name: itemNameInputController.text,
        item_price: (itemPriceInputController.text),
        item_qty: (itemQtyInputController.text),
      );
      itemNameInputController.clear();
      itemPriceInputController.clear();
      itemQtyInputController.clear();
      itempointInputController.clear();
      update();
      return true;
    }
  }

  // add new item
  void add_item(
      {required String item_name,
      required String item_point,
      required String item_price,
      required String item_qty}) {
    _itemsList.add(
      Item(
        point: item_point,
        name: item_name,
        price: item_price,
        qty: item_qty,
      ),
    );
    update();
    // calcTotal();
  }

  void remove_item({required Item item}) {
    _itemsList.remove(item);
    update();
    // calcTotal();
  }

  void clear_items() {
    _itemsList.clear();
    update();
    // calcTotal();
  }

  // void calcTotal() => _total.value = _itemsList.fold(
  //     0, (previousValue, next) => previousValue + (next.price));
}
