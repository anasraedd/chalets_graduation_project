import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Board1 extends StatelessWidget {
  const Board1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(

      decoration: const BoxDecoration(

          image: DecorationImage(
              image: AssetImage("assets/images/board1.jpeg"),
              fit: BoxFit.cover)),
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            constraints: const BoxConstraints(
              minHeight: 80,
              maxHeight: 100
            ),
            margin: EdgeInsetsDirectional.only(bottom: 166.h,start: 32.w),
            alignment: AlignmentDirectional.bottomStart,
             child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('txtTheBestTimes'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                         color: const Color(0xFFF5F8FF), fontWeight: FontWeight.w500)),
                Container(
                 margin: EdgeInsetsDirectional.only(start: 64.w ),
                  child: Text(
                    'txtWithTheFamily'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 29.sp,
                        ),

                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
