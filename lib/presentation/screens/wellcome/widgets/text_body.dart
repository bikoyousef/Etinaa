import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextBody extends StatelessWidget {
  const TextBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (77.07).sp),
          child: Text(
            'bod1'.tr,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: (77.07).sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'bod2'.tr,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const Text(' '),
              Text(
                'bod3'.tr,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
