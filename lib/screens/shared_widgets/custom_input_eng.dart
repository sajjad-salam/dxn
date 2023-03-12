import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../env/dimensions.dart';
import 'custom_richText.dart';

// ignore: camel_case_types
class CustomInput_eng extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final bool isRequired;
  final double? height;
  final TextInputAction inputaction;
  const CustomInput_eng({
    required this.label,
    required this.controller,
    this.type,
    this.height,
    this.isRequired = false,
    Key? key,
    required this.inputaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.calcH(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomRichText(
            text: label,
            children: (isRequired)
                ? [
                    const TextSpan(
                      text: "",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          ),
          SizedBox(
            height: Dimensions.calcH(10),
          ),
          Container(
            color: AppColors.kSecondaryColor,
            height: height,
            child: TextFormField(
              textDirection: TextDirection.rtl,
              textInputAction: inputaction,
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.kSecondaryColor,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
