import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '/logic/cubit/requests/requests_cubit.dart';

import '/presentation/tabs/requests_tabs_top.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';

import './widgets/body_text.dart';
import './widgets/card_body.dart';

class PackageDetailsScreen2 extends StatelessWidget {
  const PackageDetailsScreen2({Key? key}) : super(key: key);
  static const routeName = '/package_details2';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;

    final int price = args['args1'];
    final DateTime selectedDay = args['args2'];
    final String contractId = DateFormat.Hms().format(selectedDay);
    final String requestDate = DateFormat.yMMMEd().format(selectedDay);
    final num taxValue = price * (0.15);
    final num finalPrice = price + taxValue;

    void _saveRequest() {
      BlocProvider.of<RequestsCubit>(context, listen: false).addRequest(
        contractId,
        finalPrice.toString(),
        requestDate.toString(),
      );
      Navigator.of(context).pushReplacementNamed(RequestsTabsTop.routeName);
    }

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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10.h,
            ),
            StepProgress(
              circleColor1: Theme.of(context).colorScheme.secondary,
              lineColor1: Theme.of(context).colorScheme.secondary,
              circleColor2: Theme.of(context).colorScheme.secondary,
              lineColor2: Theme.of(context).colorScheme.secondary,
              circleColor3: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(
              height: 28.sp,
            ),
            const BodyText(),
            SizedBox(
              height: 23.h,
            ),
            CardBody(contractId: contractId, finalPrice: finalPrice),
            SizedBox(
              height: 40.h,
            ),
            SizedBox(
              height: (229).h,
              width: (245).w,
              child: Image.asset(
                'assets/images/package_details_screen2/contract.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            SizedBox(
              height: 47.h,
              width: 222.w,
              child: ElevateYellowBtn(
                text: 'btn6'.tr,
                onpress: _saveRequest,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
