import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/custom_button_material.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterAccountScreen extends StatelessWidget {
  RegisterAccountScreen({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController prePasswordController = TextEditingController();

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
          'txtCreateAccount'.tr(),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'txtWelcome2'.tr(),
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    'txtWelcomeToYour2'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: primaryColor),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                            controller: firstNameController,
                            hint: 'firstName'.tr(),
                            maxLength: 20,
                            context: context,
                            keyboardType: TextInputType.emailAddress),
                      ),
                      SizedBox(
                        width: 7.5.w,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                            controller: lastNameController,
                            hint: 'lastName'.tr(),
                            context: context,
                            maxLength: 20,
                            keyboardType: TextInputType.emailAddress),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                      controller: userNameController,
                      hint: 'userName'.tr(),
                      context: context,
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hint: 'password'.tr(),
                    context: context,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: prePasswordController,
                    hint: 'rePassword'.tr(),
                    context: context,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButtonMaterial(
                    buttonText: 'signUp'.tr(),
                    onTab: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'alreadyHaveAccount'.tr(),
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
                          'signIn'.tr().toUpperCase(),
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
             Align(
               alignment: Alignment.bottomCenter,
               child: Container(
                 margin: EdgeInsets.only(top: 70.h,),
                 child: Row(
                   children: [
                     SizedBox(
                       width: 30.w,
                     ),
                     RichText(text:  TextSpan(text: 'lastTextRegister'.tr(),

                     style:
                     Theme.of(context).textTheme.bodyMedium!.copyWith(
                       color: const Color(0xff000000),
                       fontSize: 15.sp,
                       fontWeight: FontWeight.w400,
                     ),
                     children: [

                       TextSpan(text: " ${'termsOfService'.tr()}",
                         style:
                         Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 15.sp,
                           color: primaryColor,
                           fontWeight: FontWeight.w600,
                         )

                       ),
                       TextSpan(text: " ${'and'.tr()}",
                           style:
                           Theme.of(context).textTheme.bodyMedium!.copyWith(
                             color: const Color(0xff000000),
                             fontSize: 13.sp,
                             fontWeight: FontWeight.w400,
                           ),
                       ),
                       TextSpan(text: " ${'privacy'.tr()}",
                           style:
                           Theme.of(context).textTheme.bodyMedium!.copyWith(
                             fontSize: 15.sp,
                             color: primaryColor,
                             fontWeight: FontWeight.w600,
                           )

                       ),


                     ]

                     ),


                     ),
                    ],
                 ),
               ),
             )

           ],
        ),
      ),
    );
  }
}
