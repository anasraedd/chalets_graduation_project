import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Board2 extends StatelessWidget {
  const Board2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/board2.jpeg"),
              fit: BoxFit.cover)),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            width: 255.w,
            height: 220.h,
            decoration: BoxDecoration(
                color: const Color(0xffd9d9d9d9),
                borderRadius: BorderRadius.circular(25.r)),
            margin: EdgeInsetsDirectional.only(top: 60.h, start: 32.w),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('txtBookYourSecond'.tr(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color(0xFF666666),
                      fontSize: 25.sp,
                        fontWeight: FontWeight.bold
                    ),
                  textAlign: TextAlign.center,),
                SizedBox(height: 4.h,),
                Text(
                  'txtHomeAndEnjoy'.tr(),
                  style:
                      Theme.of(context).textTheme.headlineSmall!.copyWith(

                        fontWeight: FontWeight.bold
                      ),
                textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
