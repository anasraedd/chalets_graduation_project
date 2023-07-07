import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_theme.dart';

class CustomButtonMaterial extends StatelessWidget {
  CustomButtonMaterial({
    Key? key,
    required this.buttonText,
    this.color = primaryColor, required this.onTab,
  }) : super(key: key);
  final String buttonText;
  final Function() onTab;

  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15.r)),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap:  onTab,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
