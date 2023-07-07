import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_button_material.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controllerText = TextEditingController();
  final TextEditingController controlleremail = TextEditingController();
  final TextEditingController controllernumber = TextEditingController();


  final TextEditingController passwordController = TextEditingController();

  bool loginByImail = true;
  bool loginByUsername = false;

  bool loginByNumberPhone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        shadowColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: primaryColor,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        toolbarHeight: 80.h,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35.r),
          bottomLeft: Radius.circular(35.r),
        )),
        title: Text(
          'login'.tr(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  // SizedBox(
                  //   height: 32.h,
                  // ),
                  Text(
                    'txtWelcome'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'txtWelcomeToYour'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'txtChooseLogin'.tr(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(0xff666666),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w200),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  // Tabs
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[200]!, blurRadius: 6),
                        ]),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 8.w,
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    loginByImail = true;
                                    loginByUsername = false;
                                    loginByNumberPhone =false;
                                  });

                                },
                                child: Container(
                                  child: Text(
                                    'email'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: loginByImail
                                            ? Color(0xFF2C8095)
                                            : Color(0xFF404040),
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 2,
                                  margin: const EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                      color: loginByImail
                                          ? Color(0xFF2C8095)
                                          : Color(0xBFE6E6E6),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){

                                  setState(() {
                                    loginByImail = false;
                                    loginByUsername = true;
                                    loginByNumberPhone =false;
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'username'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: loginByUsername
                                            ? Color(0xFF2C8095)
                                            : Color(0xFF404040),
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 2,
                                  margin: EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                      color: loginByUsername
                                          ? Color(0xFF2C8095)
                                          : Color(0xBFE6E6E6),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){

                                  setState(() {
                                    loginByImail = false;
                                    loginByUsername = false;
                                    loginByNumberPhone =true;

                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'phone'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: loginByNumberPhone
                                            ? Color(0xFF2C8095)
                                            : Color(0xFF404040),
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 2,
                                  margin: EdgeInsets.only(bottom: 4),
                                  decoration: BoxDecoration(
                                      color: loginByNumberPhone
                                          ? Color(0xFF2C8095)
                                          : Color(0xBFE6E6E6),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 88.w, vertical: 16.h),
                    child: ClipOval(
                      child: Divider(
                        color: const Color(0xFF017C9B),
                        thickness: 1.6.h,
                        height: 2,
                      ),
                    ),
                  ),
                  // text form fields
                  SizedBox(
                    height: 5.h,
                  ),
                  loginByUsername
                      ? CustomTextFormField(
                          controller: controllerText,
                          hint: 'username'.tr(),
                          context: context,
                          keyboardType: TextInputType.text)
                      : loginByNumberPhone
                          ? CustomTextFormField(
                              controller: controllernumber,
                              hint: 'phone'.tr(),
                              context: context,
                              keyboardType: TextInputType.number)
                          : CustomTextFormField(
                              controller: controlleremail,
                              hint: 'email'.tr(),
                              context: context,
                              keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hint: 'password'.tr(),
                    context: context,
                    suffixIcon: Icons.remove_red_eye_outlined,
                    keyboardType: TextInputType.visiblePassword,
                  ),

                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          'txtRecoveryPassword'.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 12.h,
                  ),
                  CustomButtonMaterial(
                    buttonText: 'justLogin'.tr(),
                    onTab: () {},
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'txtNotAMember'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xff666666),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Text(
                          'txtRegisterNow'.tr().toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 247.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginBK.png"),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
