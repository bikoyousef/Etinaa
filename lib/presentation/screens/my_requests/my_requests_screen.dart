import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '/logic/cubit/requests/requests_cubit.dart';

import './widgets/empty_body.dart';
import './widgets/requests.dart';
import './widgets/add_btn.dart';

class MyRequestsScreen extends StatelessWidget {
  const MyRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: BlocProvider.of<RequestsCubit>(context, listen: false)
          .fetchAndSetRequests(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : BlocBuilder<RequestsCubit, RequestsState>(
                  builder: (context, state) {
                    if (state.requests.isEmpty) {
                      return const EmptyBody();
                    } else {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 36.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 550.h,
                                child: ListView.separated(
                                  itemCount: state.requests.length,
                                  itemBuilder: (ctx, i) => Requests(
                                    requestId: state.requests[i].id,
                                    price: state.requests[i].price,
                                    date: state.requests[i].date,
                                  ),
                                  separatorBuilder: (ctx, i) => SizedBox(
                                    height: 30.h,
                                  ),
                                  padding: EdgeInsets.all(10.sp),
                                ),
                              ),
                              const AddBtn(
                                value: MainAxisAlignment.end,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
    );
  }
}
