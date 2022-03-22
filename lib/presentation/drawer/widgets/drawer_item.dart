import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    required this.title,
    required this.name,
    required this.height,
    required this.width,
    required this.tabHandler,
  }) : super(key: key);

  final String title;
  final String name;
  final double height;
  final double width;
  final VoidCallback tabHandler;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tabHandler,
      child: Row(
        children: <Widget>[
          Image.asset(
            name,
            height: height,
            width: width,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
