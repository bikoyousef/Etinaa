import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/package_details_text.dart';
import '../widgets/package_details_row.dart';

class RequestDetailsCard2 extends StatelessWidget {
  const RequestDetailsCard2({
    Key? key,
    required this.packageName,
    required this.priceBefore,
    required this.price,
    required this.discount,
  }) : super(key: key);

  final String packageName;
  final String priceBefore;
  final String price;
  final String discount;

  @override
  Widget build(BuildContext context) {
    return Container(
                  height: 222.h,
                  width: 301.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      const PackageDetailsText(),
                      PackageDetailsRow(
                        text: 'txt22'.tr,
                        text2: packageName,
                        cardHeight: 32.h,
                        containerHeight: 24.h,
                      ),
                      PackageDetailsRow(
                        text: 'txt23'.tr,
                        text2: priceBefore,
                        cardHeight: 32.h,
                        containerHeight: 24.h,
                      ),
                      PackageDetailsRow(
                        text: 'txt24'.tr,
                        text2: price,
                        cardHeight: 32.h,
                        containerHeight: 24.h,
                      ),
                      PackageDetailsRow(
                        text: 'txt25'.tr,
                        text2: discount,
                        cardHeight: 32.h,
                        containerHeight: 24.h,
                      ),
                    ],
                  ),
    );
  }
}
