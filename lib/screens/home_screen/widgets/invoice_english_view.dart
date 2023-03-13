// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';

import '../../../env/dimensions.dart';
import '../../../models/invoice_model.dart';
import '../../shared_widgets/custom_text.dart';

class InvoiceView_eng extends StatelessWidget {
  Invoice invoice;
  InvoiceView_eng({
    required this.invoice,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(20), horizontal: Dimensions.calcW(8)),
        padding: EdgeInsets.symmetric(
            vertical: Dimensions.calcH(5), horizontal: Dimensions.calcW(8)),
        height: Dimensions.calcH(100),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            text: invoice.date,
                            align: TextAlign.left,
                            fontSize: Dimensions.calcH(18),
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
            Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.download,
                    size: Dimensions.calcH(30),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
