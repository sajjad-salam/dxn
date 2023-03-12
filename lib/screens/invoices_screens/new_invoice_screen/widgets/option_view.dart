// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/colors.dart';
import '../../../../env/dimensions.dart';
import '../../../shared_widgets/custom_text.dart';

class OptionView_ar extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? optionalText;
  final Widget? leading;
  final bool showArrow;
  final bool isComplete;

  final Function() onTap;
  const OptionView_ar({
    required this.title,
    required this.onTap,
    this.subTitle,
    this.optionalText,
    this.leading,
    this.showArrow = true,
    this.isComplete = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (!showArrow || isComplete) ? null : onTap,
      splashColor: AppColors.kPrimaryLight,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(8), horizontal: Dimensions.calcW(8)),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5), horizontal: Dimensions.calcW(8)),
        height: Dimensions.calcH(200),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 161, 144, 124),
          // color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            (showArrow)
                ? Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(
                        "assets/icons/arrow_left.svg",
                        height: 35,
                      ),
                    ),
                  )
                : const Text(""),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          // flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CustomText(
                              text: title,
                              align: TextAlign.left,
                              fontSize: Dimensions.calcH(23),
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.calcH(5),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomText(
                            text: subTitle ?? "",
                            align: TextAlign.left,
                            fontSize: Dimensions.calcH(17),
                            weight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomText(
                            text: optionalText ?? "",
                            align: TextAlign.left,
                            fontSize: Dimensions.calcH(17),
                            weight: FontWeight.w600,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            (leading != null)
                ? Container(
                    margin: EdgeInsets.only(
                      left: Dimensions.calcW(15),
                    ),
                    padding: EdgeInsets.all(Dimensions.calcH(10)),
                    width: 70,
                    child: leading,
                  )
                : const Text(""),
          ],
        ),
      ),
    );
  }
}
