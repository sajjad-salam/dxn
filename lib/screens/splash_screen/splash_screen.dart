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
            const Text(
              AppStrings.SYS_TR,
              style: TextStyle(
                  fontFamily: "myfont", fontSize: 18, color: Colors.white),
            ),
            InkWell(
              child: Image.asset('assets/icons/tr.png', height: 150),
              onTap: () {
                Get.offAndToNamed("/home");
              },
            ),
            // IconButton(
            //   splashRadius: 100,
            //   iconSize: 200,
            //   icon: Image.asset("assets/icons/tr.png"),
            //   // icon: Ink.image(
            //   // image: Image.asset(""),
            //   // child: Image.asset("assets/icons/tr.png"),
            //   // image:  ,
            //   // ),
            //   onPressed: () {
            //     // do something when the button is pressed
            //     debugPrint('Hi there');
            //   },
            // ),
            const Text(
              AppStrings.SYS_ML,
              style: TextStyle(
                  fontFamily: "myfont", fontSize: 18, color: Colors.white),
            ),
            InkWell(
              child: Image.asset('assets/icons/mi.png', height: 150),
              onTap: () {
                Get.offAndToNamed("/home");
              },
            )
          ],
        ),
      ),
    );
  }
}
