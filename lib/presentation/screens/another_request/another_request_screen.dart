import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/another_request/another_request_cubit.dart';

import '/presentation/drawer/main_drawer.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/text_field.dart';

class AnotherRequestScreen extends StatefulWidget {
  const AnotherRequestScreen({Key? key}) : super(key: key);
  static const routeName = '/another_request';

  @override
  State<AnotherRequestScreen> createState() => _AnotherRequestScreenState();
}

class _AnotherRequestScreenState extends State<AnotherRequestScreen> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _requestTypeController = TextEditingController();
  final _requestDetailsController = TextEditingController();

  void _saveOthRequest() {
    if (_nameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _requestTypeController.text.isEmpty ||
        _requestDetailsController.text.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    BlocProvider.of<AnotherRequestCubit>(context, listen: false).addCall(
        _nameController.text,
        _phoneNumberController.text,
        _emailController.text,
        _requestTypeController.text,
        _requestDetailsController.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit16'.tr,
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 37.sp),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 28.sp,
                ),
                Text(
                  'txt35'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 22.sp,
                        color: Colors.white,
                      ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                TextFieldIn(
                  height: 42.h,
                  hintText: 'txt3'.tr,
                  controller: _nameController,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.name,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldIn(
                  height: 42.h,
                  hintText: 'txt1'.tr,
                  controller: _phoneNumberController,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.phone,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldIn(
                  height: 42.h,
                  hintText: 'txt4'.tr,
                  controller: _emailController,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldIn(
                  height: 42.h,
                  hintText: 'hinttxt3'.tr,
                  controller: _requestTypeController,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.text,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFieldIn(
                  height: 138.h,
                  hintText: 'hinttxt2'.tr,
                  controller: _requestDetailsController,
                  inputAction: TextInputAction.newline,
                  inputType: TextInputType.multiline,
                  color: Colors.black,
                  maxlines: 6,
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 222.w,
                  child: ElevateYellowBtn(
                    text: 'txtbtn6'.tr,
                    onpress: _saveOthRequest,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
