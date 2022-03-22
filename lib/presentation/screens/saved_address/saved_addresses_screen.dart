import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/address/address_cubit.dart';

import '../add_address/add_address_screen.dart';
import '../package/package_screen.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/step_progress.dart';

import './widgets/address_item.dart';
import './widgets/add_address.dart';

class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({Key? key}) : super(key: key);

  static const routeName = '/saved_addresses';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map;
    final String contractTerm = args['args1'];
    final String requiredService = args['args2'];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit9'.tr,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: (Colors.white),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FutureBuilder(
        future: BlocProvider.of<AddressCubit>(context, listen: false)
            .fetchAndSetAddresses(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  if (state.items.isEmpty) {
                    return const SingleChildScrollView(
                      child: AddAddress(),
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 36.sp),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10.h,
                            ),
                            StepProgress(
                              circleColor1:
                                  Theme.of(context).colorScheme.secondary,
                              lineColor1: Colors.grey,
                              circleColor2: Colors.grey,
                              lineColor2: Colors.grey,
                              circleColor3: Colors.grey,
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            SizedBox(
                              height: 520.h,
                              child: ListView.separated(
                                itemCount: state.items.length,
                                itemBuilder: (ctx, i) => AddressItem(
                                  text: state.item[i].title,
                                  onpress: () {
                                    Navigator.of(context).pushNamed(
                                      PackageScreen.routeName,
                                      arguments: {
                                        'args1': contractTerm,
                                        'args2': requiredService,
                                        'args3': state.items[i].id,
                                      },
                                    );
                                  },
                                ),
                                separatorBuilder: (ctx, i) => SizedBox(
                                  height: 30.h,
                                ),
                                padding: EdgeInsets.all(10.sp),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            SizedBox(
                              height: 47,
                              width: 222,
                              child: ElevateYellowBtn(
                                onpress: () {
                                  Navigator.of(context)
                                      .pushNamed(AddAddressScreen.routeName);
                                },
                                text: 'btn4'.tr,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}
