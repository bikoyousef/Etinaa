import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class TextFieldIn extends StatelessWidget {
  const TextFieldIn({
    Key? key,
    required this.height,
    this.hintText,
    required this.controller,
    required this.inputAction,
    required this.inputType,
    this.maxlines,
    this.labelText,
    required this.color,
  }) : super(key: key);
  final double height;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final int? maxlines;
  final String? labelText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 302.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15.sp,
          ),
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Colors.black,
              ),
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: Colors.black,
                fontSize: 16.sp,
              ),
        ),
        controller: controller,
        textAlign: TextAlign.start,
        textInputAction: inputAction,
        keyboardType: inputType,
        maxLines: maxlines,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              fontSize: 16.sp,
              color: color,
            ),
      ),
    );
  }
}
