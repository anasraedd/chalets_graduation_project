import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerPersonalInformation extends StatelessWidget {
  final Widget? leftWidgit;
  final Widget textWidgit;
  final Widget rightWidgit;
  final double radias;

  CustomContainerPersonalInformation(
      {this.leftWidgit, required this.textWidgit,required this.rightWidgit, this.radias = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radias.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey[300]!,
                blurRadius: 19,
                offset: const Offset(0, 4)),
          ]),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              //width: 60,
              child: leftWidgit
          ),
          // Container(
          //   color: Colors.black26,
          //   width: 1,
          //   height: 50,
          // ),
          Expanded(
            //  flex: 3,

            //  color: Colors.blue,

              child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  margin: EdgeInsets.only(right: 5),
                  child: textWidgit)),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10,),
            child: GestureDetector(
                onTap: (){

                },
                child: rightWidgit),
          )
          // Expanded(
          //     child: InkWell(
          //   child: Icon(Icons.edit_square),
          // ))
        ],
      ),

    );
  }

}
