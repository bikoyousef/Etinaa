import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PackageDetailsRow extends StatelessWidget {
  const PackageDetailsRow({
    Key? key,
    required this.text,
    required this.text2,
    required this.cardHeight,
    required this.containerHeight,
  }) : super(key: key);
  final String text;
  final String text2;
  final double cardHeight;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: cardHeight,
          width: 276.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: const Color(0xffF5F5F5),
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 24.h,
                width: 144.w,
                padding: EdgeInsetsDirectional.only(
                  top: 7.sp,
                  start: 10.sp,
                ),
                child: Text(
                  text,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                height: containerHeight,
                width: 126.w,
                padding: EdgeInsets.only(
                  top: 7.sp,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    text2,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
      ],
    );
  }
}
