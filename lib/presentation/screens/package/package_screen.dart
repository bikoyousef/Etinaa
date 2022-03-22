import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/address/address_cubit.dart';

import '/presentation/widgets/step_progress.dart';

import './widgets/packages_btn.dart';
import './package_screen2.dart';

class PackageScreen extends StatelessWidget {
  PackageScreen({Key? key}) : super(key: key);

  static const routeName = '/package';

  final int price = 299;
  final String packageName = 'packagename'.tr;
  final int priceBefore = 396;
  final String discount = 'discount'.tr;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;

    final String contractTerm = args['args1'];
    final String requiredService = args['args2'];
    final String id = args['args3'];
    final addId = BlocProvider.of<AddressCubit>(context).findById(id);
    final selectedAddress = addId.title;

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
                price: price.toString(),
                packageName: packageName,
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {
                  Navigator.of(context).pushNamed(
                    PackageScreen2.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': requiredService,
                      'args3': selectedAddress,
                      'args4': price,
                      'args5': packageName,
                      'args6': priceBefore,
                      'args7': discount,
                    },
                  );
                },
              ),
              SizedBox(
                height: 22.h,
              ),
              PackagesBtn(
                price: price.toString(),
                packageName: packageName,
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {
                  Navigator.of(context).pushNamed(
                    PackageScreen2.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': requiredService,
                      'args3': selectedAddress,
                      'args4': price,
                      'args5': packageName,
                      'args6': priceBefore,
                      'args7': discount,
                    },
                  );
                },
              ),
              SizedBox(
                height: 22.h,
              ),
              PackagesBtn(
                price: price.toString(),
                packageName: packageName,
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {
                  Navigator.of(context).pushNamed(
                    PackageScreen2.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': requiredService,
                      'args3': selectedAddress,
                      'args4': price,
                      'args5': packageName,
                      'args6': priceBefore,
                      'args7': discount,
                    },
                  );
                },
              ),
              SizedBox(
                height: 22.h,
              ),
              PackagesBtn(
                price: price.toString(),
                packageName: packageName,
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {
                  Navigator.of(context).pushNamed(
                    PackageScreen2.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': requiredService,
                      'args3': selectedAddress,
                      'args4': price,
                      'args5': packageName,
                      'args6': priceBefore,
                      'args7': discount,
                    },
                  );
                },
              ),
              SizedBox(
                height: 22.h,
              ),
              PackagesBtn(
                price: price.toString(),
                packageName: packageName,
                priceBefore: priceBefore.toString(),
                discount: discount,
                onPress: () {
                  Navigator.of(context).pushNamed(
                    PackageScreen2.routeName,
                    arguments: {
                      'args1': contractTerm,
                      'args2': requiredService,
                      'args3': selectedAddress,
                      'args4': price,
                      'args5': packageName,
                      'args6': priceBefore,
                      'args7': discount,
                    },
                  );
                },
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
