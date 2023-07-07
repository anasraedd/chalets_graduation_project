import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateTimePicker extends StatelessWidget {
  final String oldDataBirth;
  final void Function(DateTime value) onChenged;

  const CustomDateTimePicker(
      {required this.oldDataBirth, required this.onChenged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: AlignmentDirectional.center,
        margin: EdgeInsets.only(top: 30.h, right: 35.w, left: 35.w),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
          ),
          clipBehavior: Clip.antiAlias,
          height: 160,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              brightness: Brightness.light,
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle:
                    TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
            ),
            child: CupertinoDatePicker(
              initialDateTime: DateTime.parse(oldDataBirth),
              use24hFormat: true,
              backgroundColor: Colors.white,
              maximumYear: DateTime.now().year,
              onDateTimeChanged: (dateTime) {
                onChenged(dateTime);
              },
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        ),
      ),
    );
  }
}
