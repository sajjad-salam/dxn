import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../controllers/information_user.dart';
import '../../../../controllers/invoice_controller.dart';
import '../../../../env/dimensions.dart';
import '../../../shared_widgets/appbar_eng_view.dart';
import '../../../shared_widgets/custom_btn.dart';
import '../../../shared_widgets/custom_input_eng.dart';
import '../../../shared_widgets/custom_text.dart';

class NewBusinessScreen extends StatelessWidget {
  const NewBusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          controller: controller.businessNameInputController,
                          label: AppStrings.ADD_BUSINESS_NAME,
                          isRequired: true,
                        ),
                        CustomInput_eng(
                          controller: controller.businessPhoneInputController,
                          label: AppStrings.ADD_BUSINESS_PHONE,
                          isRequired: true,
                          type: TextInputType.phone,
                        ),
                        CustomInput_eng(
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
                      label: AppStrings.SAVE_BTN,
                      action: () {
                        bool isValid = controller.validate();
                        if (isValid) {
                          Get.back();
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