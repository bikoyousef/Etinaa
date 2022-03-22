import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/add_btn.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 200.h,
            ),
            Text(
              'txt33'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'txt9'.tr,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(
              height: 40.h,
            ),
            const AddBtn(
              value: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
