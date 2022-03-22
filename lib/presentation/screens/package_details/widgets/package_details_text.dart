import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageDetailsText extends StatelessWidget {
  const PackageDetailsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 18.sp,
            top: 20.sp,
            bottom: 14.sp,
          ),
          child: Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.secondary,
            size: 17.sp,
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: 4.sp,
            top: 17.sp,
            bottom: 9.sp,
          ),
          child: Text(
            'txt16'.tr,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
        ),
      ],
    );
  }
}
