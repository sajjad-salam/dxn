import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_items/widgets/custom_tablerow.dart';
import 'package:dxn/screens/shared_widgets/appbar_eng_view.dart';
import 'package:dxn/screens/shared_widgets/custom_btn.dart';
import 'package:dxn/screens/shared_widgets/custom_richText.dart';
import 'package:dxn/screens/shared_widgets/custom_text.dart';
import 'package:dxn/sys/sys_tr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/strings.dart';
import 'controllers/invoice_controller.dart';
import 'env/dimensions.dart';
import 'models/item_model.dart';

// ignore: unused_import, camel_case_types
class adminpage extends StatefulWidget {
  const adminpage({super.key});

  @override
  State<adminpage> createState() => _adminpageState();
}

// ignore: camel_case_types
class _adminpageState extends State<adminpage> {
  // const adminpage({Key? key}) : super(key: key);
  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  TextEditingController itemnameInputController = TextEditingController();
  // ignore: unused_field
  final _textEditingController = TextEditingController();

  get itemsList => _itemsList;
  get total => _total;
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  Product_tr? selectedProduct;

  int _quantity = 1;

  // ignore: prefer_final_fields
  List<String> _items = ['حليب', 'عصير', 'جبس', 'تمن', 'ببسي'];
  List<int> number_of_item = [1, 2, 3, 4, 5];
  int price_of_item = 0;
  // ignore: non_constant_identifier_names
  int point_of_item = 0;
  int _select_number = 1;
  int first_click_num = 0;
  int first_click_item = 0;
  void add_item(
      {required String item_name,
      required String item_point,
      required String item_price,
      required String item_qty}) {
    _itemsList.add(
      Item(
        name: item_name,
        price: item_price,
        qty: item_qty,
      ),
    );
    // update();
    // calcTotal();
  }

  @override
  Widget build(BuildContext context) {
    // int totala = _quantity * selectedProduct!.price;
    var valu = selectedProduct?.price.toDouble() ?? 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 182, 166),
      appBar: AppBar_eng(
        title: AppStrings.ADD_PAYER_TITLE,
        showBackArrow: true,
      ),
      body: Column(
        children: [
          if (itemsList.isNotEmpty)
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
                    .map((itemx) => CustomTableRow(
                          item: itemx,
                        ))
                    .toList(),
              ],
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 80),
                  child: DropdownButton<Product_tr>(
                    value: selectedProduct,
                    hint: const Text("اختيار منتج",
                        style: TextStyle(
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
                DropdownButton(
                  value: _quantity,
                  hint: const Text("العدد"),
                  items: List<DropdownMenuItem<int>>.generate(
                    10,
                    (index) => DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text(
                        "${index + 1}",
                      ),
                    ),
                  ),
                  onChanged: (newValue) {
                    setState(
                      () {
                        _quantity = newValue!;
                      },
                    );
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
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
                          DataCell(Text('${selectedProduct?.point}')),
                          DataCell(Text(
                            '${valu * _quantity} د.ل',
                            style: const TextStyle(fontSize: 12),
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                // Spacer(),
                Center(
                  child: CustomBtn(
                    action: () {
                      setState(() {
                        itemNameInputController.text = selectedProduct!.name;
                        itemPriceInputController.text =
                            selectedProduct!.price.toString();
                        itempointInputController.text =
                            selectedProduct!.point.toString();
                        itemQtyInputController.text = _quantity.toString();
                      });
                      add_item(
                          item_name: itemNameInputController.text,
                          item_point: itempointInputController.text,
                          item_price: itemPriceInputController.text,
                          item_qty: itemQtyInputController.text);
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
                    },
                    label: 'تنضيف',
                  ),
                ),
                Center(
                  child: CustomBtn(
                    action: () {
                      // Get.offAndToNamed("/table");
                    },
                    label: 'تيست',
                  ),
                ),
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
                text: "${AppStrings.TOTAL} : \$",
                children: [TextSpan(text: "${total.value.toStringAsFixed(2)}")],
              ),
            ),
        ],
      ),
    );
  }
}
