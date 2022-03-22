import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/card_text_yellow.dart';
import '../widgets/card_text.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    Key? key,
    required this.contractId,
    required this.finalPrice,
  }) : super(key: key);
  final String contractId;
  final num finalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 37.sp),
      child: Container(
        height: 83.h,
        width: 301.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 14.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardText(
                  text: 'txt27'.tr,
                ),
                SizedBox(
                  width: 3.w,
                ),
                CardTextY(
                  text: 'TAN$contractId',
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CardText(
                  text: 'txt28'.tr,
                ),
                SizedBox(
                  width: 3.w,
                ),
                CardTextY(
                  text: finalPrice.toString(),
                ),
                SizedBox(
                  width: 3.w,
                ),
                CardTextY(
                  text: 'currency'.tr,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
