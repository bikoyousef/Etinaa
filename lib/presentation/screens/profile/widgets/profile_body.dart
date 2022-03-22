import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/text_field.dart';

import './image_input.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.phoneNumberController,
    required this.selectImage,
    required this.saveProfile,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  final Function(File) selectImage;
  final VoidCallback saveProfile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 37.sp),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30.sp,
              ),
              ImageInput(
                onSelectImage: selectImage,
              ),
              SizedBox(
                height: 23.h,
              ),
              TextFieldIn(
                height: 46.h,
                labelText: 'txt3'.tr,
                controller: nameController,
                inputAction: TextInputAction.next,
                inputType: TextInputType.name,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 18.h,
              ),
              TextFieldIn(
                height: 46.h,
                labelText: 'txt4'.tr,
                controller: emailController,
                inputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 18.h,
              ),
              TextFieldIn(
                height: 46.h,
                labelText: 'txt1'.tr,
                controller: phoneNumberController,
                inputAction: TextInputAction.done,
                inputType: TextInputType.phone,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 47.h,
                width: 222.w,
                child: ElevateYellowBtn(
                  text: 'txtbtn6'.tr,
                  onpress: saveProfile,
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
