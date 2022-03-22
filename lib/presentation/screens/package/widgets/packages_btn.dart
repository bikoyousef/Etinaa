import 'dart:math';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackagesBtn extends StatelessWidget {
  const PackagesBtn({
    Key? key,
    required this.packageName,
    required this.price,
    required this.priceBefore,
    required this.discount,
    required this.onPress,
  }) : super(key: key);
  final String packageName;
  final String price;
  final String priceBefore;
  final String discount;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    const Color backColor = Color(0xff8EC8C0);
    return Center(
      child: GestureDetector(
        onTap: onPress,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Stack(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            children: <Widget>[
              Container(
                height: 72.h,
                width: 302.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Positioned(
                right: (-76.5).sp,
                top: -40.sp,
                child: CircleAvatar(
                  radius: 74.r,
                  backgroundColor: backColor,
                ),
              ),
              Positioned(
                top: (13.5).sp,
                right: 18.sp,
                child: Text(
                  price,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                ),
              ),
              Positioned(
                top: (40.5).sp,
                right: 27.sp,
                child: Text(
                  'currency'.tr,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                ),
              ),
              Positioned(
                top: 15.sp,
                right: 83.sp,
                child: Text(
                  packageName,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              Positioned(
                top: 37.sp,
                right: 83.sp,
                child: Row(
                  children: <Widget>[
                    Text(
                      'pricebefore'.tr,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                    ),
                    Text(
                      priceBefore,
                      style: Theme.of(context).textTheme.headline4?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.sp,
                left: -1.sp,
                child: Container(
                  height: 20.h,
                  width: 83.h,
                  decoration: const BoxDecoration(
                    color: backColor,
                  ),
                  transform: Matrix4.rotationZ(-30 * pi / 180)
                    ..translate(-10.0),
                  child: Text(
                    discount,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 17.sp,
                          color: Colors.white,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
