import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/services_screen.dart';

import '../widgets/elevate_btn.dart';

class TopCard extends StatelessWidget {
  TopCard({Key? key}) : super(key: key);

  static const Color xxxx = Color(0xff8EC8C0);
  final String service1 = 'servbtn1'.tr;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          height: 150.h,
          width: 302.w,
          decoration: const BoxDecoration(color: xxxx),
          child: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'txt7'.tr,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                        color: (Colors.white),
                      ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  'bod9'.tr,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: (Colors.white),
                      ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  'bod10'.tr,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: (Colors.white),
                      ),
                ),
                SizedBox(
                  height: (12.3).h,
                ),
                SizedBox(
                  height: 33.h,
                  width: 140.w,
                  child: ElevateBtn(
                    text: 'btn3'.tr,
                    onpress: () {
                      Navigator.of(context).pushNamed(ServicesScreen.routeName,
                          arguments: service1);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
