import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/authentication/auth_cubit.dart';

import '../../screens/another_request/another_request_screen.dart';
import '../../screens/profile/personality_screen.dart';
import '../../screens/wellcome/wellcome_screen.dart';
import '../../screens/call_us/call_us_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../tabs/requests_tabs_top.dart';
import '../widgets/drawer_item.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DrawerItem(
          title: 'drawer1'.tr,
          name: 'assets/images/drawer/home.png',
          height: 23.h,
          width: 25.w,
          tabHandler: () {
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        DrawerItem(
          title: 'drawer2'.tr,
          name: 'assets/images/drawer/profile.png',
          height: 20.h,
          width: 20.w,
          tabHandler: () {
            Navigator.of(context).pushNamed(PersonalityScreen.routeName);
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        DrawerItem(
          title: 'drawer3'.tr,
          name: 'assets/images/drawer/requests.png',
          height: 20.h,
          width: 20.w,
          tabHandler: () {
            Navigator.of(context).pushNamed(RequestsTabsTop.routeName);
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        DrawerItem(
          title: 'drawer4'.tr,
          name: 'assets/images/drawer/requests.png',
          height: 20.h,
          width: 20.w,
          tabHandler: () {
            Navigator.of(context).pushNamed(AnotherRequestScreen.routeName);
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        DrawerItem(
          title: 'drawer5'.tr,
          name: 'assets/images/drawer/callus.png',
          height: 25.h,
          width: 22.w,
          tabHandler: () {
            Navigator.of(context).pushNamed(CallUsScreen.routeName);
          },
        ),
        SizedBox(
          height: 26.h,
        ),
        DrawerItem(
          title: 'drawer6'.tr,
          name: 'assets/images/drawer/logout.png',
          height: 24.h,
          width: 24.w,
          tabHandler: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(WellcomeScreen.routeName);
            BlocProvider.of<AuthCubit>(context, listen: false).logout();
          },
        ),
      ],
    );
  }
}
