import 'package:dxn/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../env/dimensions.dart';

class SplashScreen extends StatelessWidget {
  // this is a system app turkey or malyzy if 1 turkey and if 2 maleyze
  int system_app = 0;

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
                // Get.offAndToNamed("/home");
                system_app = 1;
                print(system_app);

                Navigator.push(
                  context,
                  CupertinoPageRoute<Widget>(
                    builder: (BuildContext context) {
                      return HomeScreen(
                        sys: system_app,
                      );
                    },
                  ),
                );
              },
            ),
            const Text(
              AppStrings.SYS_ML,
              style: TextStyle(
                  fontFamily: "myfont", fontSize: 18, color: Colors.white),
            ),
            InkWell(
              child: Image.asset('assets/icons/mi.png', height: 150),
              onTap: () {
                system_app = 2;
                print(system_app);
                Navigator.push(
                  context,
                  CupertinoPageRoute<Widget>(
                    builder: (BuildContext context) {
                      return HomeScreen(
                        sys: system_app,
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
