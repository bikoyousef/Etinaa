import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeContainer extends StatefulWidget {
  TimeContainer(
      {Key? key,
      required this.text,
      required this.name,
      required this.value,
      required this.af})
      : super(key: key);
  final String text;
  final String? name;
  bool value = false;
  final Function(bool) af;

  @override
  State<TimeContainer> createState() => _TimeContainerState();
}

class _TimeContainerState extends State<TimeContainer> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: ((context, state) {
        return GestureDetector(
          onTap: () {
            state(
              () {
                widget.value = !widget.value;
                widget.af(widget.value);
              },
            );
          },
          child: Container(
            height: 75.h,
            width: 75.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: widget.value
                    ? Border.all(
                        width: 3.w,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    : Border.all(
                        width: 1.w,
                        color: Colors.grey,
                      )),
            child: Column(
              children: [
                SizedBox(
                  height: 6.h,
                ),
                Image.asset(
                  widget.name!,
                  height: 23.h,
                  width: 30.w,
                ),
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
