import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/positioned_column.dart';

class Requests extends StatelessWidget {
  const Requests({
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
    const Color backColor = Color(0xff8EC8C0);
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: <Widget>[
            Container(
              height: 88.h,
              width: 303.w,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            Positioned(
              right: -18.sp,
              top: -5.sp,
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: backColor,
              ),
            ),
            Positioned(
              top: 33.sp,
              right: 16.sp,
              child: Text(
                'txt29'.tr,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
              ),
            ),
            PositionedColumn(
              requestId: requestId,
              price: price,
              date: date,
            ),
          ],
        ),
      ),
    );
  }
}
