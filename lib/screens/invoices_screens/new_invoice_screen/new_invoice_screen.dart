import 'package:dxn/screens/invoices_screens/new_invoice_screen/widgets/option_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../controllers/invoice_controller.dart';
import '../../../controllers/invoices_controller.dart';
import '../../../env/dimensions.dart';
import '../../../models/invoice_model.dart';
import '../../shared_widgets/appbar_eng_view.dart';
import '../../shared_widgets/custom_btn.dart';

class NewInvoiceScreen extends StatelessWidget {
  const NewInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kSecondaryColor,
      appBar: AppBar_eng(
        title: AppStrings.NEW_INVOICE_PAGE_TITLE,
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              "assets/icons/circle_close.svg",
              color: AppColors.kPrimaryDark,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (scroll) {
            scroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<InvoiceController>(
              init: InvoiceController(),
              builder: (controller) {
                if (controller.id == "0") {
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  controller.id = id;
                } else {}

                return Column(
                  children: [
                    OptionView_ar(
                      onTap: () {
                        Get.toNamed("/add_items");
                      },
                      title: AppStrings.NEW_INVOICE_ITEMS,
                      leading: SvgPicture.asset("assets/icons/add_item.svg"),
                    ),
                    OptionView_ar(
                      onTap: () {
                        Get.toNamed("/add_business");
                      },
                      title: AppStrings.NEW_INVOICE_BUSINESS,
                      leading: SvgPicture.asset(
                        "assets/icons/business.svg",
                        height: 100,
                        width: 100,
                      ),
                      isComplete: (controller.business != null) ? true : false,
                      showArrow: (controller.business != null) ? false : true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomBtn(
                          label: AppStrings.PREVIEW_BTN,
                          action: () {
                            if (controller.business != null &&
                                controller.itemsList.isNotEmpty) {
                              Invoice invoice =
                                  controller.generate_preview_invoice();
                              Get.toNamed("/preview",
                                  arguments: {"القائمة": invoice});
                            } else {
                              Get.snackbar("خطأ", "من فضلك اكمل كل الحقول",
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                        ),
                        SizedBox(
                          width: Dimensions.calcW(20),
                        ),
                        CustomBtn(
                          label: AppStrings.SAVE_BTN,
                          color: AppColors.kPrimaryColor,
                          textColor: Colors.white,
                          action: () {
                            if (controller.business != null) {
                              Invoice invoice =
                                  controller.generate_preview_invoice();
                              Get.find<AllInvoiceController>()
                                  .createNewInvoice(invoice);
                              Get.back();
                            } else {
                              Get.snackbar("خطأ", "من فضلك املأ كل الحقول",
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
