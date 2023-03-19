import 'package:dxn/items_page.dart';
import 'package:dxn/screens/shared_widgets/appbar_eng_view.dart';
import 'package:dxn/screens/shared_widgets/custom_btn.dart';
import 'package:dxn/screens/shared_widgets/custom_richText.dart';
import 'package:dxn/sys/sys_my.dart';
import 'package:dxn/sys/sys_tr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/colors.dart';
import 'constants/strings.dart';
import 'controllers/invoice_controller.dart';
import 'env/dimensions.dart';
import 'models/item_model.dart';

// ignore: unused_import, camel_case_types
class adminpage extends StatefulWidget {
  const adminpage({super.key, required this.syste});
  final int syste;

  @override
  // ignore: no_logic_in_create_state
  State<adminpage> createState() => _adminpageState(syst: syste);
}

// ignore: camel_case_types
class _adminpageState extends State<adminpage> {
  _adminpageState({required this.syst});
  final int syst;

  final RxDouble _total = 0.00.obs;
  // ignore: non_constant_identifier_names
  final RxDouble _total_point = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  get itemsList => _itemsList;
  get total => _total;
  // ignore: non_constant_identifier_names
  get total_po => _total_point;
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;

  int _quantity = 1;

  Product_tr? selectedProduct;
  // ignore: non_constant_identifier_names
  Product_mi? selectedProduct_mi;
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
  }

  void calcTotal() => _total.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.price) * double.parse(next.qty)));
  // ignore: non_constant_identifier_names
  void calcTotal_point() => _total_point.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.point) * double.parse(next.qty)));

  String chose = "اختيار منتج";

  @override
  Widget build(BuildContext context) {
    var priceIt = selectedProduct?.price.toDouble() ?? 0;
    var pointIt = selectedProduct?.point.toDouble() ?? 0;
    var priceItMi = selectedProduct_mi?.price.toDouble() ?? 0;
    var pointItMi = selectedProduct_mi?.point.toDouble() ?? 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 182, 166),
      appBar: AppBar_eng(
        title: AppStrings.ADD_PAYER_TITLE,
        showBackArrow: true,
      ),
      body: Column(
        children: [
          if (syst == 1)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: DropdownButton<Product_tr>(
                    value: selectedProduct,
                    hint: Text(chose,
                        style: const TextStyle(
                            fontFamily: "myfont",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onChanged: (Product_tr? value) {
                      setState(() {
                        selectedProduct = value;
                      });
                    },
                    items: products.map((Product_tr product) {
                      return DropdownMenuItem<Product_tr>(
                        value: product,
                        child: Text(product.name),
                      );
                    }).toList(),
                  ),
                ),
                const CustomRichText(
                  text: "عدد المنتجات",
                  children: [
                    TextSpan(
                      text: "",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.calcH(5),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  onSubmitted: (value) {
                    setState(() {
                      _quantity = int.parse(value);
                      calcTotal();
                      calcTotal_point();
                    });
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  controller: itemQtyInputController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.kSecondaryColor,
                    filled: true,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    // TableBorder.all()

                    dataRowHeight: 100,
                    headingRowHeight: 50,
                    border: TableBorder.symmetric(
                        inside: const BorderSide(
                            strokeAlign: 10, color: Colors.black54),
                        outside: BorderSide.none),
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Text(
                        'اسم المنتج',
                        style: TextStyle(fontFamily: "myfont"),
                      )),
                      DataColumn(
                          label: Text('العدد',
                              style: TextStyle(fontFamily: "myfont"))),
                      DataColumn(
                          label: Text('النقاط',
                              style: TextStyle(fontFamily: "myfont"))),
                      DataColumn(
                          label: Text('السعر',
                              style: TextStyle(fontFamily: "myfont"))),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("${selectedProduct?.name}")),
                          DataCell(Text("$_quantity")),
                          DataCell(Text('${pointIt * _quantity}')),
                          DataCell(Text(
                            '${priceIt * _quantity} د.ل',
                            style: const TextStyle(fontSize: 12),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      if (selectedProduct?.name != null && _quantity != 0) {
                        setState(() {
                          itemNameInputController.text = selectedProduct!.name;
                          itemPriceInputController.text =
                              selectedProduct!.price.toString();
                          itempointInputController.text =
                              selectedProduct!.point.toString();
                          itemQtyInputController.text = _quantity.toString();
                          calcTotal();
                          calcTotal_point();
                          // update();
                        });
                        add_item(
                            item_name: itemNameInputController.text,
                            item_point: itempointInputController.text,
                            item_price: itemPriceInputController.text,
                            item_qty: itemQtyInputController.text);
                      }
                    },
                    label: 'اضافة',
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      setState(() {
                        calcTotal();
                        calcTotal_point();
                        // update();
                      });
                      itemNameInputController.clear();
                      itemPriceInputController.clear();
                      itemQtyInputController.clear();
                      itempointInputController.clear();
                      _quantity = 0;
                    },
                    label: 'تنضيف',
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      calcTotal();
                      calcTotal_point();
                      // update();
                      setState(() {
                        _total.value = _total.value;
                      });
                      Navigator.push(
                        context,
                        CupertinoPageRoute<Widget>(
                          builder: (BuildContext context) {
                            return const item_page();
                          },
                        ),
                      );
                    },
                    label: 'عرض القائمة',
                  ),
                ),
              ],
            ),
          //system mileza
          if (syst == 2)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: DropdownButton<Product_mi>(
                    value: selectedProduct_mi,
                    hint: Text(chose,
                        style: const TextStyle(
                            fontFamily: "myfont",
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    onChanged: (Product_mi? value) {
                      setState(() {
                        selectedProduct_mi = value;
                      });
                    },
                    items: product_mis_mi.map((Product_mi product) {
                      return DropdownMenuItem<Product_mi>(
                        value: product,
                        child: Text(product.name),
                      );
                    }).toList(),
                  ),
                ),
                const CustomRichText(
                  text: "عدد المنتجات",
                  children: [
                    TextSpan(
                      text: "",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimensions.calcH(5),
                ),
                TextField(
                  textDirection: TextDirection.rtl,
                  onSubmitted: (value) {
                    setState(() {
                      _quantity = int.parse(value);
                    });
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  controller: itemQtyInputController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: AppColors.kSecondaryColor,
                    filled: true,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    // TableBorder.all()

                    dataRowHeight: 100,
                    headingRowHeight: 50,
                    border: TableBorder.symmetric(
                        inside: const BorderSide(
                            strokeAlign: 10, color: Colors.black54),
                        outside: BorderSide.none),
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Text(
                        'اسم المنتج',
                        style: TextStyle(fontFamily: "myfont"),
                      )),
                      DataColumn(
                          label: Text('العدد',
                              style: TextStyle(fontFamily: "myfont"))),
                      DataColumn(
                          label: Text('النقاط',
                              style: TextStyle(fontFamily: "myfont"))),
                      DataColumn(
                          label: Text('السعر',
                              style: TextStyle(fontFamily: "myfont"))),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text("${selectedProduct_mi?.name}")),
                          DataCell(Text("$_quantity")),
                          DataCell(Text('${pointItMi * _quantity}')),
                          DataCell(Text(
                            '${priceItMi * _quantity} د.ل',
                            style: const TextStyle(fontSize: 12),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      if (selectedProduct_mi?.name != null && _quantity != 0) {
                        setState(() {
                          itemNameInputController.text =
                              selectedProduct_mi!.name;
                          itemPriceInputController.text =
                              selectedProduct_mi!.price.toString();
                          itempointInputController.text =
                              selectedProduct_mi!.point.toString();
                          itemQtyInputController.text = _quantity.toString();
                        });
                        add_item(
                            item_name: itemNameInputController.text,
                            item_point: itempointInputController.text,
                            item_price: itemPriceInputController.text,
                            item_qty: itemQtyInputController.text);
                      }
                    },
                    label: 'اضافة',
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      setState(() {});
                      itemNameInputController.clear();
                      itemPriceInputController.clear();
                      itemQtyInputController.clear();
                      itempointInputController.clear();
                      _quantity = 0;
                    },
                    label: 'تنضيف',
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute<Widget>(
                          builder: (BuildContext context) {
                            return const item_page();
                          },
                        ),
                      );
                    },
                    label: 'عرض القائمة',
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
