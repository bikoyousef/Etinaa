import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../screens/call_us/call_us_screen.dart';

class CallBtn extends StatelessWidget {
  const CallBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: 47.h,
          child: FloatingActionButton(
            child: Icon(
              Icons.headset_mic,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CallUsScreen.routeName);
            },
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
