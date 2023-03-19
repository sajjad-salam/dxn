import 'dart:collection';

import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_items/widgets/custom_tablerow.dart';
import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_user/new_user_information.dart';
import 'package:dxn/screens/shared_widgets/appbar_eng_view.dart';
import 'package:dxn/screens/shared_widgets/custom_btn.dart';
import 'package:dxn/screens/shared_widgets/custom_richText.dart';
import 'package:dxn/screens/shared_widgets/custom_text.dart';
import 'package:dxn/sys/sys_tr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'constants/colors.dart';
import 'constants/strings.dart';
import 'controllers/invoice_controller.dart';
import 'env/dimensions.dart';
import 'models/item_model.dart';

// ignore: unused_import, camel_case_types
class item_page extends StatefulWidget {
  const item_page({super.key});

  @override
  State<item_page> createState() => _adminpageState();
}

// ignore: camel_case_types
class _adminpageState extends State<item_page> {
  // const adminpage({Key? key}) : super(key: key);
  final RxDouble _total = 0.00.obs;
  final RxDouble _total_point = 0.00.obs;

  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  get itemsList => _itemsList;
  get total => _total;
  get total_po => _total_point;

  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  Product_tr? selectedProduct;
  int _quantity = 1;
  HashMap<Object?, List<GetStateUpdate>>? _updatersGroupIds =
      HashMap<Object?, List<GetStateUpdate>>();
  List<GetStateUpdate?>? _updaters = <GetStateUpdate?>[];

  void update([List<Object>? ids, bool condition = true]) {
    if (!condition) {
      return;
    }
    if (ids == null) {
      refresh();
    } else {
      for (final id in ids) {
        refreshGroup(id);
      }
    }
  }

  void refresh() {
    assert(_debugAssertNotDisposed());

    _notifyUpdate();
  }

  void _notifyUpdate() {
    for (var element in _updaters!) {
      element!();
    }
  }

  void refreshGroup(Object id) {
    assert(_debugAssertNotDisposed());

    _notifyIdUpdate(id);
  }

  void _notifyIdUpdate(Object id) {
    if (_updatersGroupIds!.containsKey(id)) {
      final listGroup = _updatersGroupIds![id]!;
      for (var item in listGroup) {
        item();
      }
    }
  }

  bool _debugAssertNotDisposed() {
    assert(() {
      if (_updaters == null) {
        throw FlutterError('''A $runtimeType was used after being disposed.\n
'Once you have called dispose() on a $runtimeType, it can no longer be used.''');
      }
      return true;
    }());
    return true;
  }

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
    calcTotal();
    calcTotal_point();
    update();
  }

  String gift = "";
  Color col = Color.fromARGB(255, 200, 182, 166);
  double tot = 0.0;
  void calcTotal() => _total.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.price) * double.parse(next.qty)));
  void calcTotal_point() => _total_point.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.point) * double.parse(next.qty)));
  @override
  Widget build(BuildContext context) {
    var price_it = selectedProduct?.price.toDouble() ?? 0;
    var point_it = selectedProduct?.price.toDouble() ?? 0;
    return SingleChildScrollView(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 182, 166),
        appBar: AppBar_eng(
          title: "قائمة المنتجات",
          showBackArrow: true,
        ),
        body: Center(
          child: Column(
            children: [
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: <Widget>[
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child:
                              const CustomText(text: AppStrings.ADD_ITEMS_NAME),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: const CustomText(
                              text: AppStrings.ADD_ITEMS_PRICE),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child:
                              const CustomText(text: AppStrings.ADD_ITEMS_QTY),
                        ),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: const CustomText(
                              text: AppStrings.ADD_ITEMS_ACTIONS),
                        ),
                      ),
                    ],
                  ),
                  ...itemsList
                      .map((itemx) => CustomTableRow(
                            item: itemx,
                          ))
                      .toList(),
                ],
              ),
              if (itemsList.isNotEmpty)
                SizedBox(
                  height: Dimensions.calcH(25),
                ),
              if (itemsList.isNotEmpty) const Divider(),
              if (itemsList.isNotEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomRichText(
                    text: "${AppStrings.TOTAL} : \د\.\ل",
                    children: [
                      TextSpan(text: "${total.value.toStringAsFixed(2)}")
                    ],
                  ),
                ),
              Text(
                "$gift",
                style:
                    TextStyle(color: col, fontFamily: "myfont", fontSize: 18),
              ),
              CustomBtn(
                label: "التالي",
                action: () {
                  calcTotal();
                  calcTotal_point();

                  Navigator.push(
                    context,
                    CupertinoPageRoute<Widget>(
                      builder: (BuildContext context) {
                        return NewBusinessScreen();
                      },
                    ),
                  );
                },
              ),
              CustomBtn(
                label: "حساب المبلغ الكلي",
                action: () {
                  // print(total);
                  if (_total.value == 0) {
                    calcTotal();
                    calcTotal_point();
                    update();
                  }
                  setState(() {
                    double tot = _total.value;
                    if (_total_point.value > 100) {
                      gift = "مبروك التوصيل مجانا";
                      col = Colors.green;
                    } else {
                      gift = "اكمل 100 نقطة لتحصل على توصيل مجانا";
                      col = Colors.red;
                    }
                  });
                  update();
                  print(_total.value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
