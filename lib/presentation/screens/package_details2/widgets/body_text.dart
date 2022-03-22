import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyText extends StatelessWidget {
  const BodyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 60.sp,
      ),
      child: Text(
        'txt26'.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 22.sp,
              color: Colors.white,
            ),
      ),
    );
  }
}
