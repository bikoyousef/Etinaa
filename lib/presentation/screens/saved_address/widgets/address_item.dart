import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class AddressItem extends StatefulWidget {
  const AddressItem({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);

  final String text;
  final VoidCallback onpress;

  @override
  State<AddressItem> createState() => _AddressItemState();
}

class _AddressItemState extends State<AddressItem> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.loose,
        children: <Widget>[
          GestureDetector(
            onTap: value
                ? widget.onpress
                : () {
                    return;
                  },
            child: Container(
              height: 77.h,
              width: 303.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 13.sp,
            bottom: 12.sp,
            right: 62.sp,
            left: 40.sp,
            child: SingleChildScrollView(
              child: Text(
                widget.text,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: Colors.black),
                textAlign: TextAlign.start,
                softWrap: true,
                overflow: TextOverflow.visible,
              ),
            ),
          ),
          Positioned(
            top: -20.sp,
            right: 15.sp,
            child: GestureDetector(
              onTap: () {
                setState(
                  () {
                    value = !value;
                  },
                );
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    width: 5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.sp),
                  child: value
                      ? Icon(
                          Icons.check,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 25,
                        )
                      : const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 25,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
