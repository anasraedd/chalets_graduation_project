import 'package:chalets/core/api/auth_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/auth_and_routing_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/custom_button_material.dart';
import '../widgets/custom_text_form_field.dart';

enum LoginWayKeys { email, username, mobile }

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helpers {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _numberPhoneTextController =
      TextEditingController();

  final FocusNode _usernameFocasNode = FocusNode();
  final FocusNode _emailFocasNode = FocusNode();
  final FocusNode _numberPhoneFocasNode = FocusNode();

  final TextEditingController _passwordTextController = TextEditingController();

  LoginWayKeys selectedKey = LoginWayKeys.email;

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
          'login'.tr(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast,
        ),
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
                                onTap: () {
                                  setState(() {
                                    selectedKey = LoginWayKeys.email;
                                    // _currentKeyboardType =
                                    //     TextInputType.emailAddress;

                                    final currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    _emailFocasNode.requestFocus();

                                    // loginByImail = true;
                                    // loginByUsername = false;
                                    // loginByNumberPhone =false;
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'email'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: selectedKey == LoginWayKeys.email
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
                                      color: selectedKey == LoginWayKeys.email
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
                                onTap: () {
                                  setState(() {
                                    selectedKey = LoginWayKeys.username;
                                    // _currentKeyboardType = TextInputType.text;

                                    final currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    _usernameFocasNode.requestFocus();
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'username'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color:
                                            selectedKey == LoginWayKeys.username
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
                                      color:
                                          selectedKey == LoginWayKeys.username
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
                                onTap: () {
                                  setState(() {
                                    //_currentKeyboardType = TextInputType.number;

                                    selectedKey = LoginWayKeys.mobile;
                                    final currentFocus = FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    _numberPhoneFocasNode.requestFocus();
                                  });
                                },
                                child: Container(
                                  child: Text(
                                    'phone'.tr(),
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                        color: selectedKey ==
                                                LoginWayKeys.mobile
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
                                      color: selectedKey ==
                                              LoginWayKeys.mobile
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
                  selectedKey == LoginWayKeys.username
                      ? CustomTextFormField(
                          controller: _usernameTextController,
                          hint: 'username'.tr(),
                          context: context,
                          keyboardType: TextInputType.text,
                          focusNode: _usernameFocasNode,
                        )
                      : selectedKey == LoginWayKeys.mobile
                          ? CustomTextFormField(
                              controller: _numberPhoneTextController,
                              hint: 'phone'.tr(),
                              context: context,
                              keyboardType: TextInputType.number,
                              focusNode: _numberPhoneFocasNode,
                            )
                          : CustomTextFormField(
                              controller: _emailEditingController,
                              hint: 'email'.tr(),
                              context: context,
                              keyboardType: TextInputType.emailAddress,
                              //selectedKey == LoginWayKeys.numberPhone ? TextInputType.number :TextInputType.emailAddress,
                              focusNode: _emailFocasNode,
                            ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GetX<AuthAndRoutingGetxController>(
                      init: AuthAndRoutingGetxController(),
                      builder: (AuthAndRoutingGetxController controller) {
                        return CustomTextFormField(
                          controller: _passwordTextController,
                          hint: 'password'.tr(),
                          context: context,
                         // suffixIcon: controller.visablePassword.value ? Icons.remove_red_eye_outlined :null,
                          keyboardType: TextInputType.visiblePassword,
                            obscureText: !controller.visablePassword.value,
                          suffix: controller.visablePassword.value ? GestureDetector(
                              onTap: (){
                                controller.visablePassword.value = false;

                              },
                              child: Icon(Icons.remove_red_eye_outlined, color: secondaryColor, size: 21,)) :  GestureDetector(
                              onTap: (){
                                controller.visablePassword.value = true;

                              },
                              child: SvgPicture.asset('assets/icons/password_eye.svg')) ,
                        );
                      }),


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
                    onTab: () {
                      _performLogin();
                    },
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
                        onTap: () {
                          Get.toNamed('/verification_by_mobile_screen');
                        },
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

  Future<void> _performLogin() async {
    // if(selectedKey == LoginWayKeys.email){
    //
    // }else if(selectedKey == LoginWayKeys.username){
    //
    // }else{
    //
    // }
    if (_checkDate()) {
      await _login();
    }
  }

  bool _checkDate() {
    if (_passwordTextController.text.isNotEmpty) {
      if (selectedKey == LoginWayKeys.email &&
          _emailEditingController.text.isNotEmpty) {
        return true;
      } else if (selectedKey == LoginWayKeys.username &&
          _usernameTextController.text.isNotEmpty) {
        return true;
      } else if (selectedKey == LoginWayKeys.mobile &&
          _numberPhoneTextController.text.isNotEmpty) {
        return true;
      }
    }

    showSnackBarByGet(title: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    showLoadingDialog(context);

    // Future.delayed(Duration(seconds: 5), () {
    //   Get.back();
    // });
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print(fcmToken);
    late ApiResponse apiResponse;
    if(selectedKey == LoginWayKeys.email){
      apiResponse = await AuthApiController().login(
        keyLogin: LoginWayKeys.email.name,
          valueLogin: _emailEditingController.text,
          password: _passwordTextController.text);
    }else if(selectedKey == LoginWayKeys.mobile){
      apiResponse = await AuthApiController().login(
          keyLogin: LoginWayKeys.mobile.name,
          valueLogin: _numberPhoneTextController.text,
          password: _passwordTextController.text);
      // apiResponse = await AuthApiController().loginByNumberPhone(mobile: _numberPhoneTextController.text, password: _passwordTextController.text);
    }else if(selectedKey == LoginWayKeys.username){
      apiResponse = await AuthApiController().login(
          keyLogin: LoginWayKeys.username.name,
          valueLogin: _usernameTextController.text,
          password: _passwordTextController.text);
      // apiResponse = await AuthApiController().loginByUsername(username: _usernameTextController.text, password: _passwordTextController.text);
    }

    // showSnackBarByGet(title: apiResponse.message, error: false);

    if (apiResponse.success) {
      Get.offAllNamed('/main_screen');
    } else {
      Get.back();
      showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);
    }
  }
}
