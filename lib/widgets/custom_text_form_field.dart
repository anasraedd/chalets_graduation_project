import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/utils/helpers.dart';

class CustomTextFormField extends StatelessWidget with Helpers {
  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    required this.context,
    this.maxLength,
    this.suffixIcon,
    this.fieldValue,
    this.fieldEdit,
    this.isEnable = true,
    required this.controller,
    this.childBottomSheet,
    this.onClicked,
  }) : super(key: key);
  final String hint;
  final TextInputType keyboardType;
  bool isEnable;
  final IconData? suffixIcon;
  final int? maxLength;
  final BuildContext context;
  final String? fieldValue;
  final String? fieldEdit;
  final TextEditingController controller;

  final Widget? childBottomSheet;
  void Function()? onClicked;

  TextEditingController customControllerBottomSheet = TextEditingController();
  //FocusNode _focusNode = FocusNode();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypeNewPasswordController = TextEditingController();


  // void onClicked(void Function() onClicked){
  //
  // }

  @override
  Widget build(BuildContext context) {
    if (this.fieldValue != null) {
      customControllerBottomSheet.text = this.fieldValue!;
    }
    return Stack(
      children: [
        Container(
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[300]!,
                    blurRadius: 19,
                    offset: const Offset(0, 4)),
              ]),
        ),
        TextFormField(
          readOnly: !isEnable,
          //enabled: isEnable,

          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          controller: controller,
          validator: (value) {
            // if (value!.isEmpty) return lang!.password;
            return null;
          },
          maxLines: 1,
          keyboardType: keyboardType,
          obscureText: hint == 'Password' ? true : false,

          maxLength: maxLength,
          decoration: InputDecoration(
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      onClicked != null ? onClicked!():Center(child: Text('Nothing'),);
                    },
                    child: Icon(
                      suffixIcon,
                      color: Colors.black38,
                      size: 20,
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(minHeight: 40, minWidth: 40),
            hintText: hint,
            hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: const Color(0x80ABABAB)),
            counter: Container(),
            fillColor: Colors.white,
            isDense: true,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.r),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }

  void actionShowBottomSheet() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  height: 30,
                  width: 30,
                  color: Colors.blue,
                );
              });
        });
  }
}
// Container(
// height: 56.h,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.r),
// color: Colors.white,
// boxShadow: [
// BoxShadow(
// color: Colors.grey[300]!,
// blurRadius: 19,
// offset: const Offset(0, 4)),
// ],
// ),
// padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 2.h),
// child: TextFormField(
// decoration: InputDecoration(
// hintText: hint,
// border: InputBorder.none,
// counter: null
// ),
// maxLines: 1,
//
//
// ),
// )
