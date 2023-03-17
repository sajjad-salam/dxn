// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/items_controller.dart';
import '../../../../../models/item_model.dart';
import '../../../../shared_widgets/custom_text.dart';

//note
TableRow CustomTableRow({required Item? item}) {
  ItemsController controller = Get.put(ItemsController());
  final peice = double.parse(item!.price);
  final number = double.parse(item!.qty);
  final point = double.parse(item!.point);

  return TableRow(
    children: <Widget>[
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(0),
          child: CustomText(
            text: (item != null) ? item.name : "null",
            fontSize: 12,
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: CustomText(
            text: (item != null) ? " \د\.\ل ${peice * number} " : "-",
            fontSize: 12,
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          child: CustomText(
            text: (item != null) ? item.qty : "-",
            fontSize: 12,
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text((item != null) ? "${point * number}" : "-"),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                alignment: Alignment.center,
                height: 30,
                width: 30,
                child: IconButton(
                  splashRadius: 18,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    (item != null)
                        ? controller.remove_item(item: item)
                        : print("null");
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
