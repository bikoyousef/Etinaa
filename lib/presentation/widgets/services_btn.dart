import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ServicesBtn extends StatelessWidget {
  const ServicesBtn(
      {Key? key, this.name, required this.text, required this.onpress})
      : super(key: key);
  final String text;
  final VoidCallback onpress;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: SizedBox(
          height: 62.h,
          width: 303.w,
          child: ElevatedButton(
            onPressed: onpress,
            child: Row(
              children: <Widget>[
                Image.asset(
                  name!,
                  height: 42.h,
                  width: 34.w,
                ),
                SizedBox(
                  width: 12.w,
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
