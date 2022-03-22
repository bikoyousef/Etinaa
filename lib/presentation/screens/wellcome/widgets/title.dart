import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Tit extends StatelessWidget {
  const Tit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'tit2'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
              ),
        ),
        Text(
          'tit3'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2?.copyWith(
                color: const Color(0xff249384),
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
