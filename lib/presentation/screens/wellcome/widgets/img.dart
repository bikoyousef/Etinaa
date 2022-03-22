import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Img extends StatelessWidget {
  const Img({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (202.79).h,
      width: (306.87).w,
      child: Image.asset(
        'assets/images/wellcome_screen/landing.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
