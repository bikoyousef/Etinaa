import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../package_details/package_details_screen.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';

import './widgets/packages_btn.dart';
import './widgets/date_picker.dart';
import './widgets/time_picker.dart';

class PackageScreen2 extends StatefulWidget {
  const PackageScreen2({Key? key}) : super(key: key);
  static const routeName = '/package2';

  @override
  State<PackageScreen2> createState() => _PackageScreen2State();
}

class _PackageScreen2State extends State<PackageScreen2> {
  DateTime selectedDay = DateTime.now();
  bool valueMorning = false;
  bool valueAfternoon = false;
  bool valueEvening = false;
  String? visitingTime;

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

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit12'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
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
              PackagesBtn(
                packageName: packageName,
                price: price.toString(),
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {},
              ),
              SizedBox(
                height: 28.h,
              ),
              DatePicker(
                pickedDay: selectedDay,
                picked: (val) {
                  selectedDay = val;
                },
              ),
              SizedBox(
                height: 28.h,
              ),
              TimePicker(
                  valueMorning: valueMorning,
                  valueAfternoon: valueAfternoon,
                  valueEvening: valueEvening,
                  morning: (val) {
                    valueMorning = val;
                  },
                  afternoon: (val) {
                    valueAfternoon = val;
                  },
                  evening: (val) {
                    valueEvening = val;
                  }),
              SizedBox(
                height: 28.h,
              ),
              SizedBox(
                height: 47.h,
                width: 222.w,
                child: ElevateYellowBtn(
                  text: 'btn5'.tr,
                  onpress: () {
                    if (valueMorning && !valueAfternoon && !valueEvening) {
                      visitingTime = 'txt13'.tr;
                      Navigator.of(context).pushNamed(
                        PackageDetailsScreen.routeName,
                        arguments: {
                          'args1': contractTerm,
                          'args2': requiredService,
                          'args3': selectedAddress,
                          'args4': price,
                          'args5': packageName,
                          'args6': priceBefore,
                          'args7': discount,
                          'args8': selectedDay,
                          'args9': visitingTime
                        },
                      );
                    } else if (!valueMorning &&
                        valueAfternoon &&
                        !valueEvening) {
                      visitingTime = 'txt14'.tr;
                      Navigator.of(context).pushNamed(
                        PackageDetailsScreen.routeName,
                        arguments: {
                          'args1': contractTerm,
                          'args2': requiredService,
                          'args3': selectedAddress,
                          'args4': price,
                          'args5': packageName,
                          'args6': priceBefore,
                          'args7': discount,
                          'args8': selectedDay,
                          'args9': visitingTime
                        },
                      );
                    } else if (!valueMorning &&
                        !valueAfternoon &&
                        valueEvening) {
                      visitingTime = 'txt15'.tr;
                      Navigator.of(context).pushNamed(
                        PackageDetailsScreen.routeName,
                        arguments: {
                          'args1': contractTerm,
                          'args2': requiredService,
                          'args3': selectedAddress,
                          'args4': price,
                          'args5': packageName,
                          'args6': priceBefore,
                          'args7': discount,
                          'args8': selectedDay,
                          'args9': visitingTime
                        },
                      );
                    } else {
                      return;
                    }
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
    );
  }
}
