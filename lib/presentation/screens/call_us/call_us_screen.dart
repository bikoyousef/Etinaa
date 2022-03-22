import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/logic/cubit/call_us/call_cubit.dart';

import '/presentation/drawer/main_drawer.dart';

import '/presentation/widgets/elevate_yellow_btn.dart';
import '/presentation/widgets/text_field.dart';

class CallUsScreen extends StatefulWidget {
  const CallUsScreen({Key? key}) : super(key: key);
  static const routeName = '/call_us';

  @override
  State<CallUsScreen> createState() => _CallUsScreenState();
}

class _CallUsScreenState extends State<CallUsScreen> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _requestController = TextEditingController();

  void _saveCallUs() {
    if (_nameController.text.isEmpty ||
        _phoneNumberController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _requestController.text.isEmpty) {
      return;
    }
    FocusScope.of(context).unfocus();
    BlocProvider.of<CallCubit>(context, listen: false).addCall(
      _nameController.text,
      _phoneNumberController.text,
      _emailController.text,
      _requestController.text,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'tit15'.tr,
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
                  'txt34'.tr,
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
                  height: 138.h,
                  hintText: 'hinttxt2'.tr,
                  controller: _requestController,
                  inputAction: TextInputAction.done,
                  inputType: TextInputType.multiline,
                  maxlines: 6,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  height: 47.h,
                  width: 222.w,
                  child: ElevateYellowBtn(
                    text: 'txtbtn6'.tr,
                    onpress: _saveCallUs,
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
