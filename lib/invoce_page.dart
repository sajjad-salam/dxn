import 'dart:async';
import 'dart:collection';
import 'dart:ui' as ui;

import 'dart:typed_data';
import 'package:dxn/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_items/widgets/custom_tablerow.dart';
import 'package:dxn/screens/shared_widgets/appbar_eng_view.dart';
import 'package:dxn/screens/shared_widgets/custom_btn.dart';
import 'package:dxn/screens/shared_widgets/custom_richText.dart';
import 'package:dxn/screens/shared_widgets/custom_text.dart';
import 'package:dxn/sys/sys_tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'constants/strings.dart';
import 'controllers/invoice_controller.dart';
import 'env/dimensions.dart';
import 'models/item_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

// ignore: camel_case_types
class invo extends StatefulWidget {
  const invo(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.name_user,
      // ignore: non_constant_identifier_names
      required this.name_of_mmber,
      // ignore: non_constant_identifier_names
      required this.phone_number,
      // ignore: non_constant_identifier_names
      required this.number_mmber,
      required this.address});
  // ignore: non_constant_identifier_names
  final String name_user;
  // ignore: non_constant_identifier_names
  final String name_of_mmber;
  // ignore: non_constant_identifier_names
  final String phone_number;
  // ignore: non_constant_identifier_names
  final String number_mmber;
  final String address;
  @override
  // ignore: no_logic_in_create_state
  State<invo> createState() => _invoState(
        address: address,
        name_of_mmber: name_of_mmber,
        name_user: name_user,
        number_mmber: number_mmber,
        phone_number: phone_number,
      );
}

// ignore: camel_case_types
class _invoState extends State<invo> {
  _invoState(
      // ignore: non_constant_identifier_names
      {required this.name_user,
      // ignore: non_constant_identifier_names
      required this.name_of_mmber,
      // ignore: non_constant_identifier_names
      required this.phone_number,
      // ignore: non_constant_identifier_names
      required this.number_mmber,
      required this.address});
  // ignore: non_constant_identifier_names
  final String name_user;
  // ignore: non_constant_identifier_names
  final String name_of_mmber;
  // ignore: non_constant_identifier_names
  final String phone_number;
  // ignore: non_constant_identifier_names
  final String number_mmber;
  final String address;
  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  final _screenshotController = ScreenshotController();
  final ScreenshotController screenshotController = ScreenshotController();
  void _CaptureScreenShot() async {
    //get paint bound of your app screen or the widget which is wrapped with RepaintBoundary.
    RenderRepaintBoundary bound =
        _key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    if (bound.debugNeedsPaint) {
      Timer(Duration(seconds: 1), () => _CaptureScreenShot());
      return null;
    }
    ui.Image image = await bound.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // this will save image screenshot in gallery
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final resultsave = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');
      print(resultsave);
    }
  }

  get itemsList => _itemsList;
  get total => _total;
  // ignore: non_constant_identifier_names
  get total_po => _total_point;

  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  Product_tr? selectedProduct;
  // ignore: non_constant_identifier_names
  final RxDouble _total_point = 0.00.obs;

  // ignore: unused_field
  final int _quantity = 1;
  final HashMap<Object?, List<GetStateUpdate>> _updatersGroupIds =
      HashMap<Object?, List<GetStateUpdate>>();
  final List<GetStateUpdate?> _updaters = <GetStateUpdate?>[];

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
    for (var element in _updaters) {
      element!();
    }
  }

  void refreshGroup(Object id) {
    assert(_debugAssertNotDisposed());

    _notifyIdUpdate(id);
  }

  void _notifyIdUpdate(Object id) {
    if (_updatersGroupIds.containsKey(id)) {
      final listGroup = _updatersGroupIds[id]!;
      for (var item in listGroup) {
        item();
      }
    }
  }

  bool _debugAssertNotDisposed() {
    assert(() {
      // ignore: unnecessary_null_comparison
      if (_updaters == null) {
        throw FlutterError('''A $runtimeType was used after being disposed.\n
'Once you have called dispose() on a $runtimeType, it can no longer be used.''');
      }
      return true;
    }());
    return true;
  }

  // ignore: non_constant_identifier_names
  void add_item(
      // ignore: non_constant_identifier_names
      {required String item_name,
      // ignore: non_constant_identifier_names
      required String item_point,
      // ignore: non_constant_identifier_names
      required String item_price,
      // ignore: non_constant_identifier_names
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
  Color col = const Color.fromARGB(255, 200, 182, 166);

  void calcTotal() => _total.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.price) * double.parse(next.qty)));
  // ignore: non_constant_identifier_names
  void calcTotal_point() => _total_point.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.point) * double.parse(next.qty)));
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 200, 182, 166),
        appBar: AppBar_eng(
          title: "الوصل",
          showBackArrow: true,
        ),
        body: Column(
          children: [
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(
                  children: <Widget>[
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child:
                            const CustomText(text: AppStrings.ADD_ITEMS_NAME),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child:
                            const CustomText(text: AppStrings.ADD_ITEMS_PRICE),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const CustomText(text: AppStrings.ADD_ITEMS_QTY),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const CustomText(
                            text: AppStrings.ADD_ITEMS_ACTIONS),
                      ),
                    ),
                  ],
                ),
                ...itemsList
                    .map(
                      (itemx) => CustomTableRow(
                        item: itemx,
                      ),
                    )
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
                  text: "${AppStrings.TOTAL} : .د.ل",
                  children: [TextSpan(text: _total.value.toString())],
                ),
              ),
            Text(
              gift,
              style: TextStyle(color: col, fontFamily: "myfont", fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              // padding: EdgeInsets.only(left: 1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    "$name_user   :الأسم\n $address   :العنوان\n $phone_number   :رقم الهاتف\n $name_of_mmber   :اسم العضوية\n$number_mmber   :رقم العضوية",
                    style: const TextStyle(fontFamily: "myfont", fontSize: 18),
                  ),
                ],
              ),
            ),
            CustomBtn(
              label: "حساب المبلغ الكلي",
              action: () {
                if (_total.value == 0) {
                  calcTotal();
                  calcTotal_point();

                  update();
                }
                setState(
                  () {
                    if (_total_point.value > 100) {
                      gift = "مبروك التوصيل مجانا";
                      col = Colors.green;
                    } else {
                      gift = "اكمل 100 نقطة لتحصل على توصيل مجانا";
                      col = Colors.red;
                    }
                  },
                );
                update();
                // print(_total.value);
              },
            ),
            Screenshot(
              controller: _screenshotController,
              child: const Text(
                'اضغط على الزر بألأسفل لأخذ لقطة شاشة',
                style: TextStyle(
                    fontSize: 14, color: Colors.white, fontFamily: "myfont"),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _CaptureScreenShot();
          },
          child: const Icon(Icons.camera),
        ),
      ),
    );
  }
}
