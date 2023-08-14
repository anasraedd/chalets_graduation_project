import 'dart:math';
import 'dart:ui';

import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/featuers/Auth/presentation/pages/login_screen.dart';
import 'package:chalets/get/auth_and_routing_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/user.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/theme/app_theme.dart';
import '../widgets/custom_button_material.dart';
import '../widgets/custom_text_form_field.dart';

class RegisterAccountScreen extends StatefulWidget {
  @override
  State<RegisterAccountScreen> createState() => _RegisterAccountScreenState();
}

class _RegisterAccountScreenState extends State<RegisterAccountScreen>
    with Helpers {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController lastNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController prePasswordController = TextEditingController();
  late String? fcmToken;

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
        leading: Container(),
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
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast,
          ),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GetX<AuthAndRoutingGetxController>(
                      init: AuthAndRoutingGetxController(),
                      builder: (AuthAndRoutingGetxController controller) {
                        return Column(
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
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (String value) {
                                      // setState(() {
                                      controller.userNameValue.value =
                                          generateUsernameFromName(
                                              '${firstNameController.text}${lastNameController.text}');
                                      userNameController.text =
                                          controller.userNameValue.value;

                                      //   });
                                    },
                                  ),
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
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: (String value) {
                                      controller.userNameValue.value =
                                          generateUsernameFromName(
                                              '${firstNameController.text}${lastNameController.text}');
                                      userNameController.text =
                                          controller.userNameValue.value;
                                    },
                                  ),
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
                                keyboardType: TextInputType.text),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                                controller: emailController,
                                hint: 'email'.tr(),
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
                              obscureText:
                                  !controller.visablePasswordInRegister.value,
                              suffix: controller.visablePasswordInRegister.value
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.visablePasswordInRegister
                                            .value = false;
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: secondaryColor,
                                        size: 21,
                                      ))
                                  : GestureDetector(
                                      onTap: () {
                                        controller.visablePasswordInRegister
                                            .value = true;
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/password_eye.svg')),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextFormField(
                              controller: prePasswordController,
                              hint: 'rePassword'.tr(),
                              context: context,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText:
                                  !controller.visablePasswordInRegister.value,
                              suffix: controller.visablePasswordInRegister.value
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.visablePasswordInRegister
                                            .value = false;
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: secondaryColor,
                                        size: 21,
                                      ))
                                  : GestureDetector(
                                      onTap: () {
                                        controller.visablePasswordInRegister
                                            .value = true;
                                      },
                                      child: SvgPicture.asset(
                                          'assets/icons/password_eye.svg')),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            CustomButtonMaterial(
                              buttonText: 'signUp'.tr(),
                              onTab: () async => await _performeRegister(),
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: const Color(0xff666666),
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offNamed('/login_screen');
                                  },
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
                        );
                      })),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 70.h,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30.w,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'lastTextRegister'.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: const Color(0xff000000),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                            children: [
                              TextSpan(
                                  text: " ${'termsOfService'.tr()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      )),
                              TextSpan(
                                text: " ${'and'.tr()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xff000000),
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              TextSpan(
                                  text: " ${'privacy'.tr()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 15.sp,
                                        color: primaryColor,
                                        fontWeight: FontWeight.w600,
                                      )),
                            ]),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _performeRegister() async {
    if (_checkDate()) {
      await _register();
    }
  }

  bool _checkDate() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        userNameController.text.isNotEmpty &&
       emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        prePasswordController.text.isNotEmpty) {
      if (passwordController.text.trim() == prePasswordController.text.trim()) {
        return true;
      } else {
        showSnackBarByGet(title: 'The password does not match', error: true);
      }
    }

    showSnackBarByGet(title: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _register() async {
    showLoadingDialog(context);
    // SVProgressHUD.setBackgroundColor(Colors.blue);
    // SVProgressHUD.setBackgroundLayerColor(Colors.green);
    // SVProgressHUD.setHapticsEnabled(false);
    // SVProgressHUD.show(status: 'Doing Stuff',);
    //
    // Future.delayed(Duration(seconds: 2), (){
    //
    // });
    fcmToken = await FirebaseMessaging.instance.getToken();

    ApiResponse apiResponse = await AuthApiController().register(user);
    Get.back();
    showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);

    if (apiResponse.success) {
      Get.offNamed('/main_screen');
    } else {

    }
  }

  User get user {
    User user = User();
    // String? fcmToken = await FirebaseMessaging.instance.getToken();

    user.firstName = firstNameController.text;
    user.lastName = lastNameController.text;
    user.username = userNameController.text;
    user.password = passwordController.text;
    user.mobile = '0595345880';
    user.fcmToket = fcmToken!;

    return user;
  }
}
