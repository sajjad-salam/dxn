import 'package:dxn/screens/invoices_screens/new_invoice_screen/new_items/widgets/custom_tablerow.dart';
import 'package:dxn/screens/shared_widgets/appbar_eng_view.dart';
import 'package:dxn/screens/shared_widgets/custom_richText.dart';
import 'package:dxn/screens/shared_widgets/custom_text.dart';
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
  String _selectedItem = 'Option 1';
  // ignore: prefer_final_fields
  List<String> _items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];

  @override
  Widget build(BuildContext context) {
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
            // adminpage(),
            SafeArea(
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "لا توجد اي منتجات ",
                      style: TextStyle(fontFamily: "myfont", fontSize: 18),
                    ),
                  ),
                  DropdownButton(
                    value: _selectedItem,
                    items: _items.map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                        itemNameInputController.text = newValue;
                      });
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                        child: const Text(
                        'اضافة الى القائمة',
                        style: TextStyle(fontFamily: "myfont"),
                      ),
                      onPressed: () {
                        // ignore: avoid_print
                        print(itemNameInputController.text);
                      },
                    ),
                  ),
                ],
              ),
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
