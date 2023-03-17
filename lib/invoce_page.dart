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
// import 'package:screenshot/screenshot.dart';
import 'constants/strings.dart';
import 'controllers/invoice_controller.dart';
import 'env/dimensions.dart';
import 'models/item_model.dart';

class invoce_page extends StatelessWidget {
  invoce_page(
      {required this.name_user,
      required this.name_of_mmber,
      required this.phone_number,
      required this.number_mmber,
      required this.address});
  final String name_user;
  final String name_of_mmber;
  final String phone_number;
  final String number_mmber;
  final String address;

  final RxDouble _total = 0.00.obs;
  TextEditingController itemNameInputController = TextEditingController();
  TextEditingController itemPriceInputController = TextEditingController();
  TextEditingController itemQtyInputController = TextEditingController();
  TextEditingController itempointInputController = TextEditingController();
  get itemsList => _itemsList;
  get total => _total;
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  Product_tr? selectedProduct;
  int _quantity = 1;
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
  }

  @override
  Widget build(BuildContext context) {
    var price_it = selectedProduct?.price.toDouble() ?? 0;
    var point_it = selectedProduct?.price.toDouble() ?? 0;
    return Scaffold(
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
                      child: const CustomText(text: AppStrings.ADD_ITEMS_NAME),
                    ),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const CustomText(text: AppStrings.ADD_ITEMS_PRICE),
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
                      child:
                          const CustomText(text: AppStrings.ADD_ITEMS_ACTIONS),
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
                children: [TextSpan(text: "${total.value.toStringAsFixed(2)}")],
              ),
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
            label: "سكرين شوت وارسال",
            action: () {},
          )
        ],
      ),
    );
  }
}
