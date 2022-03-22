import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/presentation/widgets/services_btn.dart';
import '../../services/services_screen.dart';

class ServicesBtns extends StatelessWidget {
  ServicesBtns({Key? key}) : super(key: key);

  final String service1 = 'servbtn1'.tr;
  final String service2 = 'servbtn2'.tr;
  final String service3 = 'servbtn3'.tr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ServicesBtn(
          name: 'assets/images/home_screen/daily.png',
          text: service1,
          onpress: () {
            Navigator.of(context)
                .pushNamed(ServicesScreen.routeName, arguments: service1);
          },
        ),
        SizedBox(
          height: 16.h,
        ),
        ServicesBtn(
            name: 'assets/images/home_screen/weekly.png',
            text: service2,
            onpress: () {
              Navigator.of(context)
                  .pushNamed(ServicesScreen.routeName, arguments: service2);
            }),
        SizedBox(
          height: 16.h,
        ),
        ServicesBtn(
          name: 'assets/images/home_screen/monthly.png',
          text: service3,
          onpress: () {
            Navigator.of(context)
                .pushNamed(ServicesScreen.routeName, arguments: service3);
          },
        ),
      ],
    );
  }
}
