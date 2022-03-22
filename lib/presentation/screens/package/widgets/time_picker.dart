import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/time_container.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    Key? key,
    required this.valueMorning,
    required this.valueAfternoon,
    required this.valueEvening,
    required this.morning,
    required this.afternoon,
    required this.evening,
  }) : super(key: key);

  final bool valueMorning;
  final bool valueAfternoon;
  final bool valueEvening;

  final Function(bool) morning;
  final Function(bool) afternoon;
  final Function(bool) evening;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: 302.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 12.sp, right: 15.sp, bottom: 11.sp, left: 15.sp),
            child: Text(
              'txt12'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 23.sp, right: 20.sp, left: 20.sp),
            child: Row(
              children: <Widget>[
                TimeContainer(
                  text: 'txt13'.tr,
                  name: 'assets/images/package_screen2/time_picker/morning.png',
                  value: widget.valueMorning,
                  af: (val) {
                    widget.morning(val);
                  },
                ),
                SizedBox(
                  width: 19.w,
                ),
                TimeContainer(
                  text: 'txt14'.tr,
                  name:
                      'assets/images/package_screen2/time_picker/afternoon.png',
                  value: widget.valueAfternoon,
                  af: (val) {
                    widget.afternoon(val);
                  },
                ),
                SizedBox(
                  width: 19.w,
                ),
                TimeContainer(
                  text: 'txt15'.tr,
                  name: 'assets/images/package_screen2/time_picker/evening.png',
                  value: widget.valueEvening,
                  af: (val) {
                    widget.evening(val);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
