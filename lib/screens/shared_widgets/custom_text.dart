import 'package:flutter/material.dart';

import '../../env/dimensions.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double spacing;
  final double height;
  final Color color;
  final TextAlign align;
  final FontWeight weight;
  final TextDirection? textdirection;
  final TextOverflow? overflow;
  const CustomText({
    required this.text,
    this.fontSize,
    this.spacing = 0,
    this.height = 1,
    this.color = Colors.black,
    this.align = TextAlign.center,
    this.weight = FontWeight.normal,
    this.overflow,
    this.textdirection,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow ?? TextOverflow.ellipsis,
      textDirection: textdirection ?? TextDirection.ltr,
      textAlign: align,
      style: TextStyle(
        fontFamily: "myfont",
        color: color,
        fontSize: fontSize ?? Dimensions.calcH(18),
        fontWeight: weight,
        height: height,
        letterSpacing: spacing,
      ),
    );
  }
}
