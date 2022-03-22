import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '/presentation/screens/package_details2/package_details_screen2.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';

import './widgets/request_details_card1.dart';
import './widgets/request_details_card2.dart';

class PackageDetailsScreen extends StatelessWidget {
  const PackageDetailsScreen({Key? key}) : super(key: key);
  static const routeName = '/package_details';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;

    final String contractTerm = args['args1'];
    final String requiredService = args['args2'];
    final String selectedAddress = args['args3'];
    final int price = args['args4'];
    final String packageName = args['args5'];
    final int priceBefore = args['args6'];
    final String discount = args['args7'];
    final DateTime selectedDay = args['args8'];
    final String visitingTime = args['args9'];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit13'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.sp),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                StepProgress(
                  circleColor1: Theme.of(context).colorScheme.secondary,
                  lineColor1: Theme.of(context).colorScheme.secondary,
                  circleColor2: Theme.of(context).colorScheme.secondary,
                  lineColor2: Colors.grey,
                  circleColor3: Colors.grey,
                ),
                SizedBox(
                  height: 28.h,
                ),
                RequestDetailsCard1(
                  requiredService: requiredService,
                  contractTerm: contractTerm,
                  visitingTime: visitingTime,
                  selectedDay: DateFormat.yMMMMd().format(selectedDay),
                  selectedAddress: selectedAddress,
                ),
                SizedBox(
                  height: 27.h,
                ),
                RequestDetailsCard2(
                  packageName: packageName,
                  priceBefore: priceBefore.toString(),
                  price: price.toString(),
                  discount: discount,
                ),
                SizedBox(
                  height: 23.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 222.w,
                  child: ElevateYellowBtn(
                    text: 'btn5'.tr,
                    onpress: () {
                      Navigator.of(context).pushNamed(
                        PackageDetailsScreen2.routeName,
                        arguments: {
                          'args1': price,
                          'args2': selectedDay,
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
