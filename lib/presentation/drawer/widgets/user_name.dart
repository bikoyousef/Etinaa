import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  const UserName({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  final Image image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            height: (80).h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: image),
        SizedBox(
          width: 11.w,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.black,
              ),
        )
      ],
    );
  }
}
