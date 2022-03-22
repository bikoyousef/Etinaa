import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '/presentation/screens/home/home_screen.dart';

class AddBtn extends StatelessWidget {
  const AddBtn({
    Key? key,
    required this.value,
  }) : super(key: key);

  final MainAxisAlignment value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: value,
      children: <Widget>[
        SizedBox(
          height: 47.h,
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
            backgroundColor: Colors.white,
          ),
        )
      ],
    );
  }
}
