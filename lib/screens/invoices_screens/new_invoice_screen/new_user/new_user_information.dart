import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../controllers/information_user.dart';
import '../../../../controllers/invoice_controller.dart';
import '../../../../env/dimensions.dart';
import '../../../../invoce_page.dart';
import '../../../../models/item_model.dart';
import '../../../shared_widgets/appbar_eng_view.dart';
import '../../../shared_widgets/custom_btn.dart';
import '../../../shared_widgets/custom_input_eng.dart';

// ignore: use_key_in_widget_constructors
class NewBusinessScreen extends StatelessWidget {
  // const NewBusinessScreen({Key? key, this.Business}) : super(key: key);
  // final Business;
  get itemsList => _itemsList;
  final RxDouble _total = 0.00.obs;
  get total => _total;
  final RxList<Item> _itemsList = Get.find<InvoiceController>().itemsList;
  void calcTotal() => _total.value = _itemsList.fold(
      0,
      (previousValue, next) =>
          previousValue + (double.parse(next.price) * double.parse(next.qty)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 200, 182, 166),
      appBar: AppBar_eng(
        title: AppStrings.ADD_BUSINESS_TITLE,
        showBackArrow: true,
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            child: GetBuilder<BusinessController>(
              init: BusinessController(),
              builder: (controller) => Container(
                margin: EdgeInsets.symmetric(
                  vertical: Dimensions.calcH(5),
                  horizontal: Dimensions.calcW(15),
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomInput_eng(
                          inputaction: TextInputAction.next,
                          controller: controller.businessNameInputController,
                          label: AppStrings.ADD_BUSINESS_NAME,
                          isRequired: true,
                        ),
                        CustomInput_eng(
                          inputaction: TextInputAction.next,
                          controller:
                              controller.businessnamemmberInputController,
                          label: "اسم العضوية",
                          isRequired: true,
                        ),
                        CustomInput_eng(
                          inputaction: TextInputAction.next,
                          controller:
                              controller.businessnumbermmberInputController,
                          label: "رقم العضوية",
                          isRequired: true,
                          type: TextInputType.number,
                        ),
                        CustomInput_eng(
                          inputaction: TextInputAction.next,
                          controller: controller.businessPhoneInputController,
                          label: AppStrings.ADD_BUSINESS_PHONE,
                          isRequired: true,
                          type: TextInputType.phone,
                        ),
                        CustomInput_eng(
                          inputaction: TextInputAction.done,
                          controller: controller.businessAddressInputController,
                          label: AppStrings.ADD_BUSINESS_ADDRESS,
                          height: Dimensions.calcH(100),
                          isRequired: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.calcH(50),
                    ),
                    CustomBtn(
                      label: AppStrings.NETX_BTN,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          calcTotal();

                          Navigator.push(
                            context,
                            CupertinoPageRoute<Widget>(
                              builder: (BuildContext context) {
                                return invo(
                                  name_user: controller
                                      .businessNameInputController.text,
                                  address: controller
                                      .businessAddressInputController.text,
                                  name_of_mmber: controller
                                      .businessnamemmberInputController.text,
                                  number_mmber: controller
                                      .businessnumbermmberInputController.text,
                                  phone_number: controller
                                      .businessPhoneInputController.text,
                                );
                              },
                            ),
                          );
                        }
                      },
                      color: AppColors.kPrimaryColor,
                      textColor: Colors.white,
                      width: Dimensions.calcW(150),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
