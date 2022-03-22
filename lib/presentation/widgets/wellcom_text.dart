import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WellcomText extends StatelessWidget {
  const WellcomText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: (75).sp,
        ),
        Text(
          'tit6'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: const Color(0xff249384),
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'bod5'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        Text(
          'bod6'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          'bod7'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        SizedBox(
          height: 25.h,
        )
      ],
    );
  }
}
