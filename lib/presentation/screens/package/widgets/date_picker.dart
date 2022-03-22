import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DatePicker extends StatefulWidget {
  DatePicker({
    Key? key,
    required this.pickedDay,
    required this.picked,
  }) : super(key: key);
  DateTime pickedDay;
  final Function(DateTime) picked;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164.h,
      width: 302.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                top: 12.sp, right: 15.sp, bottom: 7.sp, left: 15.sp),
            child: Text(
              'txt11'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 19.sp),
              child: Text(
                DateFormat.MMMM().format(widget.pickedDay),
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ),
          StatefulBuilder(
            builder: ((context, state) {
              return WeeklyDatePicker(
                selectedDay: widget.pickedDay,
                changeDay: (value) => state(
                  () {
                    widget.pickedDay = value;
                    widget.picked(widget.pickedDay);
                  },
                ),
                weekdays: [
                  'day3'.tr,
                  'day4'.tr,
                  'day5'.tr,
                  'day6'.tr,
                  'day7'.tr,
                  'day1'.tr,
                  'day2'.tr,
                ],
                backgroundColor: Colors.white,
                selectedBackgroundColor:
                    Theme.of(context).colorScheme.secondary,
                enableWeeknumberText: false,
              );
            }),
          ),
        ],
      ),
    );
  }
}
