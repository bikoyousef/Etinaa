import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class GradientBtn extends StatelessWidget {
  const GradientBtn({Key? key, required this.text, required this.onpress})
      : super(key: key);
  final String text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xff0EC9E7);
    const Color shadow = Color(0xff42656A);
    return GestureDetector(
      onTap: onpress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primary,
                shadow,
              ],
              begin: Alignment.center,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
