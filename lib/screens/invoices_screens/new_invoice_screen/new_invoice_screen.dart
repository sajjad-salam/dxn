import 'package:dxn/ad_item.dart';
import 'package:dxn/screens/invoices_screens/new_invoice_screen/widgets/option_view.dart';
import 'package:flutter/cupertino.dart';
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
  const NewInvoiceScreen({required this.system});
  final int system;

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
                        // Get.toNamed("/add_items");
                        Navigator.push(
                          context,
                          CupertinoPageRoute<Widget>(
                            builder: (BuildContext context) {
                              return adminpage(
                                syste: system,
                              );
                            },
                          ),
                        );
                      },
                      title: AppStrings.NEW_INVOICE_ITEMS,
                      leading: SvgPicture.asset("assets/icons/add_item.svg"),
                    ),
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
