import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class PositionedColumnText extends StatelessWidget {
  const PositionedColumnText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: Colors.black,
          ),
    );
  }
}
