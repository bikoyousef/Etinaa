import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register/register_screen.dart';
import '../login/login_screen.dart';

import '/presentation/widgets/gradient_btn.dart';
import '/presentation/widgets/text_btn.dart';

import './widgets/text_body.dart';
import './widgets/title.dart';
import './widgets/img.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/wellcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('tit1'.tr),
        centerTitle: true,
        toolbarHeight: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: (75).sp,
            ),
            const Tit(),
            SizedBox(
              height: 30.h,
            ),
            const Img(),
            SizedBox(
              height: (31.21).sp,
            ),
            const TextBody(),
            SizedBox(
              height: (24.5).sp,
            ),
            SizedBox(
              height: 47.h,
              width: 222.sp,
              child: GradientBtn(
                text: 'btn1'.tr,
                onpress: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
            ),
            SizedBox(
              height: 17.sp,
            ),
            TextBtn(
              text: 'bod4'.tr,
              onpress: () {
                Navigator.of(context)
                    .pushReplacementNamed(RegisterScreen.routeName);
              },
              txtbtn: 'txtbtn1'.tr,
            )
          ],
        ),
      ),
    );
  }
}
