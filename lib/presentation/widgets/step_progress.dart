import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class StepProgress extends StatelessWidget {
  const StepProgress({
    Key? key,
    required this.circleColor1,
    required this.lineColor1,
    required this.circleColor2,
    required this.lineColor2,
    required this.circleColor3,
  }) : super(key: key);
  final Color circleColor1;
  final Color lineColor1;
  final Color circleColor2;
  final Color lineColor2;
  final Color circleColor3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 14.r,
            backgroundColor: circleColor1,
            child: Text(
              '1',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
            ),
          ),
          Container(
            height: 0,
            width: 66.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: lineColor1,
              ),
            ),
          ),
          CircleAvatar(
            radius: 14.r,
            backgroundColor: circleColor2,
            child: Text(
              '2',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
            ),
          ),
          Container(
            height: 0,
            width: 66.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: lineColor2,
              ),
            ),
          ),
          CircleAvatar(
            radius: 14.r,
            backgroundColor: circleColor3,
            child: Text(
              '3',
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
