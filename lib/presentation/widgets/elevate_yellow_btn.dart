import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ElevateYellowBtn extends StatelessWidget {
  const ElevateYellowBtn({Key? key, required this.text, required this.onpress})
      : super(key: key);
  final String text;
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: ElevatedButton(
        onPressed: onpress,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
