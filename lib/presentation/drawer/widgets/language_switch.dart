import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({Key? key}) : super(key: key);

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  
  bool currentValue = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'lang2'.tr,
          style:
              Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 16.sp),
        ),
        SizedBox(
          width: 3.w,
        ),
        Switch(
          value: currentValue,
          activeColor: Theme.of(context).colorScheme.secondary,
          onChanged: (newValue) {
            setState(
              () {
                currentValue = newValue;
                Get.locale == const Locale('ar')
                    ? Get.updateLocale(
                        const Locale('en'),
                      )
                    : Get.updateLocale(
                        const Locale('ar'),
                      );
              },
            );
          },
        ),
        SizedBox(
          width: 3.w,
        ),
        Text(
          'lang1'.tr,
          style:
              Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 16.sp),
        ),
      ],
    );
  }
}
