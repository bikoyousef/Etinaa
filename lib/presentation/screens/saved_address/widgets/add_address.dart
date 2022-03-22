import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../add_address/add_address_screen.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';

import '../widgets/text.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10.h,
          ),
          StepProgress(
            circleColor1: Theme.of(context).colorScheme.secondary,
            lineColor1: Colors.grey,
            circleColor2: Colors.grey,
            lineColor2: Colors.grey,
            circleColor3: Colors.grey,
          ),
          SizedBox(
            height: 200.h,
          ),
          Txt(
            text: 'txt8'.tr,
          ),
          SizedBox(
            height: 5.h,
          ),
          Txt(
            text: 'txt9'.tr,
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 47,
            width: 222,
            child: ElevateYellowBtn(
              onpress: () {
                Navigator.of(context).pushNamed(AddAddressScreen.routeName);
              },
              text: 'btn4'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
