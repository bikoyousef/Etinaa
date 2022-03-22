import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../another_request/another_request_screen.dart';

class RequestBtn extends StatelessWidget {
  RequestBtn({Key? key}) : super(key: key);
  
  final String service4 = 'servbtn4'.tr;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: SizedBox(
          height: 62.h,
          width: 303.w,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                AnotherRequestScreen.routeName,
              );
            },
            child: Text(
              service4,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
