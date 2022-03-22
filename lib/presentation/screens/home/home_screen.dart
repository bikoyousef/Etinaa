import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/presentation/drawer/main_drawer.dart';

import './widgets/services_btns.dart';
import './widgets/request_btn.dart';
import '../../widgets/call_btn.dart';
import './widgets/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit7'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: const MainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.h,
              ),
              TopCard(),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'txt6'.tr,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: (Colors.white),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ServicesBtns(),
              SizedBox(
                height: 16.h,
              ),
              RequestBtn(),
              SizedBox(
                height: 88.h,
              ),
              const CallBtn(),
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
