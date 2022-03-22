import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/positioned_column_textye.dart';
import '../widgets/positioned_column_text.dart';

class PositionedColumn extends StatelessWidget {
  const PositionedColumn({
    Key? key,
    required this.requestId,
    required this.price,
    required this.date,
  }) : super(key: key);
  final String requestId;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15.sp,
      right: 85.sp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'txt30'.tr,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                requestId,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: <Widget>[
              PositionedColumnText(
                text: 'txt31'.tr,
              ),
              SizedBox(
                width: 5.w,
              ),
              PositionedColumnTextY(
                text: price,
              ),
              SizedBox(
                width: 3.w,
              ),
              PositionedColumnTextY(
                text: 'currency'.tr,
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: <Widget>[
              PositionedColumnText(
                text: 'txt32'.tr,
              ),
              SizedBox(
                width: 5.w,
              ),
              PositionedColumnTextY(
                text: date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
