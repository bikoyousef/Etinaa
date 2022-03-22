import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../saved_address/saved_addresses_screen.dart';

import '/presentation/drawer/main_drawer.dart';

import '/presentation/widgets/services_btn.dart';
import '/presentation/widgets/call_btn.dart';

class ServicesScreen extends StatelessWidget {
  ServicesScreen({Key? key}) : super(key: key);

  static const routeName = '/services';

  final String service1 = 'servbtn5'.tr;
  final String service2 = 'servbtn6'.tr;
  final String service3 = 'servbtn7'.tr;
  final String service4 = 'servbtn8'.tr;
  final String service5 = 'servbtn9'.tr;
  final String service6 = 'servbtn10'.tr;

  @override
  Widget build(BuildContext context) {
    final contractTerm = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit8'.tr,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                color: (Colors.white),
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
              Text(
                'txt6'.tr,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: (Colors.white),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/child_care.png',
                text: service1,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service1,
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/maintainence.png',
                text: service2,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service2,
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/plumping.png',
                text: service3,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service3,
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/child_care.png',
                text: service4,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service4,
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/cleaning.png',
                text: service5,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service5,
                    },
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              ServicesBtn(
                name: 'assets/images/services_screen/gardens.png',
                text: service6,
                onpress: () {
                  Navigator.of(context).pushNamed(
                    SavedAddressesScreen.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': service6,
                    },
                  );
                },
              ),
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
