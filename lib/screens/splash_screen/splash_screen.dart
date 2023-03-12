import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../env/dimensions.dart';
import '../shared_widgets/custom_btn.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/logo.png",
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: Dimensions.calcH(15),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            SizedBox(
              height: Dimensions.calcH(5),
            ),
            CustomBtn(
              label: AppStrings.START_BTN,
              action: () {
                Get.offAndToNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
