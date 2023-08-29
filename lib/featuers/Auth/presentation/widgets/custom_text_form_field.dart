import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget with Helpers {
  CustomTextFormField({
    Key? key,
    required this.hint,

    required this.keyboardType,
    required this.context,
    this.maxLength,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.fieldValue,

    this.fieldEdit,
    this.isEnable = true,
    required this.controller,
    this.childBottomSheet,
    this.onClicked,
    this.onChanged,
    this.focusNode,
    this.height= 56,
    this.hintStyle,
    this.obscureText = false,
  }) : super(key: key);
  final String hint;
  final TextInputType keyboardType;
  bool isEnable;
  final IconData? suffixIcon;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final BuildContext context;
  final String? fieldValue;
  final String? fieldEdit;
  final TextEditingController controller;

  final Widget? childBottomSheet;
  void Function()? onClicked;
  void Function(String value)? onChanged;
  final FocusNode? focusNode;
  final double height ;
  final TextStyle? hintStyle;
  final bool obscureText;

  TextEditingController customControllerBottomSheet = TextEditingController();

  //FocusNode _focusNode = FocusNode();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypeNewPasswordController = TextEditingController();

  // void onClicked(void Function() onClicked){
  //
  // }

  String? _errorMessage(String? str) {
    if (str!.isEmpty) {
      // switch (hint) {
      //   case 'Enter Email':
      //     return 'Email is required';
      //   case 'Enter Password':
      //     return 'Password is required';
      //   case 'Enter Full Name':
      //     return 'Full Name is required';
      // }
      return '$hint is required';
    } else {
      return '$hint is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.fieldValue != null) {
      customControllerBottomSheet.text = this.fieldValue!;
    }
    return Stack(
      children: [
        Container(
          height: height.h,
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
          onChanged: onChanged,



         focusNode: focusNode,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          controller: controller,
          validator: _errorMessage,
          maxLines: 1,
          keyboardType: keyboardType,
          obscureText: obscureText,

          maxLength: maxLength,
          decoration: InputDecoration(
            prefixIcon:  prefix ,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: () {
                      onClicked != null
                          ? onClicked!()
                          : Center(
                              child: Text('Nothing'),
                            );
                    },
                    child: Icon(
                      suffixIcon,
                      color: Colors.black38,
                      size: 20,
                    ),
                  )
                : null,
            suffix:  suffix,
            suffixIconConstraints: BoxConstraints(minHeight: height, minWidth: 40),
            hintText: hint,
            hintStyle: hintStyle != null ? hintStyle : GoogleFonts.inter(
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
