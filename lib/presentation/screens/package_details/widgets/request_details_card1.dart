import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/package_details_text.dart';
import '../widgets/package_details_row.dart';

class RequestDetailsCard1 extends StatelessWidget {
  const RequestDetailsCard1({
    Key? key,
    required this.requiredService,
    required this.contractTerm,
    required this.visitingTime,
    required this.selectedDay,
    required this.selectedAddress,
  }) : super(key: key);

  final String requiredService;
  final String contractTerm;
  final String visitingTime;
  final String selectedDay;
  final String selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 287.h,
      width: 301.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          const PackageDetailsText(),
          PackageDetailsRow(
            text: 'txt17'.tr,
            text2: requiredService,
            cardHeight: 32.h,
            containerHeight: 24.h,
          ),
          PackageDetailsRow(
            text: 'txt18'.tr,
            text2: contractTerm,
            cardHeight: 32.h,
            containerHeight: 24.h,
          ),
          PackageDetailsRow(
            text: 'txt19'.tr,
            text2: visitingTime,
            cardHeight: 32.h,
            containerHeight: 24.h,
          ),
          PackageDetailsRow(
            text: 'txt20'.tr,
            text2: selectedDay,
            cardHeight: 32.h,
            containerHeight: 24.h,
          ),
          PackageDetailsRow(
            text: 'txt21'.tr,
            text2: selectedAddress,
            cardHeight: 64.h,
            containerHeight: 57.h,
          )
        ],
      ),
    );
  }
}
