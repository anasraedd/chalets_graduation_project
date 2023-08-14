import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/images_api_controller.dart';
import 'package:chalets/core/api/user_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/user_getx_controller.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_theme.dart';
import '../../core/utils/helpers.dart';

import '../../widgets/CustomDateTimePicker.dart';
import '../../widgets/custom_container_personal_information.dart';
import '../../widgets/custom_content_bottom_sheet.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_text_form_field.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen>
    with Helpers {
  late ImagePicker _imagePicker;
  XFile? _pickedImage;



  late String firstName;
  late String lastName;
  late String email;
  late String username;
  late String mobile;
  late String datebirth;
  late String gender;
  String language = 'English';
  String selectedDateTime = '2001-01-02';

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController genderController;
  late TextEditingController dateBirthController;
  late TextEditingController passwordController;
  late TextEditingController languageController;


  @override
  void initState() {
    firstName =
        '${SharedPrefController().getValueFor<String>(key: PrefKeys.firstName.name) ?? ''}';
    lastName =
        '${SharedPrefController().getValueFor<String>(key: PrefKeys.lastName.name ?? '')}';
    email =
        '${SharedPrefController().getValueFor<String>(key: PrefKeys.email.name ?? '')}' ;
    mobile =
    '${SharedPrefController().getValueFor<String>(key: PrefKeys.mobile.name) ?? ''}' ;
    username =
    '${SharedPrefController().getValueFor<String>(key: PrefKeys.username.name) ?? ''}';
    datebirth =
    '${SharedPrefController().getValueFor<String>(key: PrefKeys.datebirth.name) ?? ''}';
    gender =
    '${SharedPrefController().getValueFor<String>(key: PrefKeys.gender.name) ?? ''}';


    firstNameController =  TextEditingController(text: firstName);
    lastNameController =  TextEditingController(text: lastName);
    phoneNumberController =  TextEditingController(text: mobile ?? '');
    userNameController =  TextEditingController(text: username ?? '');
    emailController =  TextEditingController(text: email ?? '');
    genderController =  TextEditingController(text: gender ?? '');
    dateBirthController =  TextEditingController(text: datebirth ?? '');
    passwordController =  TextEditingController(text: '1234568');
    languageController =  TextEditingController(text: language);
    _imagePicker = ImagePicker();
    super.initState();
  }

  // '${SharedPrefController().getValueFor<String>(key: PrefKeys.firstName.name)} ${SharedPrefController().getValueFor<String>(key: PrefKeys.lastName.name)}',

  // final TextEditingController lastNameController =
  //     TextEditingController(text: lastName);


  TextEditingController customControllerBottomSheet = TextEditingController();

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypeNewPasswordController = TextEditingController();

  final List<String> list = [
    "(+970) Palestine",
    "(+962) Jorden1",
    "(+971) Ema rat"
  ];

  static List<String> languages = [
    "English",
    "Arabic",
  ];



  //int indexOfLanguage=0;

  var value = "(+970) Palestine";
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var lang = AppLocalizations.of(context)!;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            shadowColor: primaryColor,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: primaryColor,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            toolbarHeight: 80.h,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
            )),
            title: Text(
              lang.tr("personalInformationScreen"),
              style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25.sp,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                MyFlutterApp.back,
                color: Colors.white,
                size: 30,
              ),
            )),
        body: Stack(children: [
          ScrollConfiguration(
            behavior: MyBehavior(),
            child: ListView(
              children: [
                Container(
                  height: 97,
                  alignment: AlignmentDirectional.topStart,
                  margin: EdgeInsets.only(top: 30.h, right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 97.w,
                        width: 97.w,
                        child: Stack(
                          children: [
                            Container(
                              // margin: EdgeInsetsDirectional.symmetric(
                              //     horizontal: 10.w),
                              clipBehavior: Clip.hardEdge,
                              height: 75.w,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                shape: BoxShape.circle,
                              ),
                              child: _pickedImage != null
                                  ? Image.file(
                                      File(_pickedImage!.path),
                                      height: 75.w,
                                      width: 75.w,
                                      fit: BoxFit.cover,
                                    )
                                  : CachedNetworkImage(
                                      height: 75.w,
                                      width: 75.w,
                                      // height: 228.0,
                                      imageUrl: SharedPrefController()
                                              .getValueFor<String>(
                                                  key: PrefKeys
                                                      .accountPicture.name) ??
                                          '',
                                      //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac',
                                      //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/images%2Fuser-removebg-preview.png?alt=media&token=6af53acd-89ef-4f7c-9772-81d60b0b54a1',
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          SpinKitFadingCircle(
                                            color: Colors.grey.shade500,
                                            size: 50.0,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Center(
                                              child: Icon(
                                            Icons.account_circle,
                                            size: 75.w,
                                            color: primaryColor,
                                          ))),
                            ),
                            GestureDetector(
                              onTap: () {
                                _pickImage();
                              },
                              child: Container(
                                height: 34,
                                width: 34,
                                alignment: AlignmentDirectional.bottomEnd,
                                margin:
                                    const EdgeInsets.only(top: 40, left: 32),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // margin: const EdgeInsets.only(top: 5, left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${firstName} ${lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: primaryColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                            Text(
                              '${email}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Color(0xFFABABAB),
                                      fontSize: 12.5.sp,
                                      fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                  //color: Colors.blue,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                controller: firstNameController,
                                hint: lang.tr("firstName"),
                                suffixIcon: Icons.edit_square,
                                isEnable: false,
                                context: context,
                                keyboardType: TextInputType.text,
                                onClicked: () {
                                  customControllerBottomSheet.text =
                                      firstNameController.text;
                                  bottomSheet(
                                    context: context,
                                    body: CustomContentBottomSheet(
                                      titleAction: 'Username',
                                      controller: firstNameController,
                                      child: Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 50.w),
                                          child: Expanded(
                                            child: Center(
                                              child: Container(
                                                  child: CustomTextField(
                                                hint: 'Enter your firstName',
                                                keyboardType:
                                                    TextInputType.text,
                                                context: context,
                                                controller:
                                                    customControllerBottomSheet,
                                                autofocus: true,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onClicked: () async {
                                        if (customControllerBottomSheet
                                            .text.isNotEmpty) {
                                          Get.back();
                                          firstName =
                                              customControllerBottomSheet.text;

                                          firstNameController.text =
                                              customControllerBottomSheet.text;
                                        } else {
                                          showSnackBar(
                                              context: context,
                                              content: 'Not exsist for editing',
                                              error: true);
                                        }
                                      },
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                                controller: lastNameController,
                                hint: lang.tr('lastName'),
                                isEnable: false,
                                context: context,
                                suffixIcon: Icons.edit_square,
                                keyboardType: TextInputType.text,
                                onClicked: () {
                                  customControllerBottomSheet.text =
                                      lastNameController.text;
                                  bottomSheet(
                                    context: context,
                                    body: CustomContentBottomSheet(
                                      titleAction: 'Last name',
                                      controller: languageController,
                                      child: Expanded(
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 50.w),
                                          child: Expanded(
                                            child: Center(
                                              child: Container(
                                                  child: CustomTextField(
                                                hint: 'Enter your Last name',
                                                keyboardType:
                                                    TextInputType.text,
                                                context: context,
                                                controller:
                                                    customControllerBottomSheet,
                                                autofocus: true,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onClicked: () async {
                                        if (customControllerBottomSheet
                                            .text.isNotEmpty) {
                                          Get.back();
                                          lastName =
                                              customControllerBottomSheet.text;
                                          lastNameController.text =
                                              customControllerBottomSheet.text;
                                        } else {
                                          showSnackBar(
                                              context: context,
                                              content: 'Not exsist for editing',
                                              error: true);
                                        }
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 9.w,
                            ),
                            Container(
                              height: 35.r,
                              width: 35.r,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(55555555.r),
                                  image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkTH-DzIvjzwp8sWLMlShkkc3Vt6xAfPIwM9xAlZiyoLgiT8U24TaLhHu4HCJ5wsxswDo&usqp=CAU'))),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            VerticalDivider(
                              width: 1.w,
                              color: Color(0xFFD9D9D9),
                              thickness: 1.w,
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 3.5.h, left: 10, right: 2),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      value.split(" ")[0],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 3.5.h, left: 5, right: 2),
                                      height: 50.h,
                                      child: TextFormField(
                                        keyboardType: TextInputType.phone,
                                        controller: phoneNumberController,
                                        readOnly: true,
                                        onChanged: (a) {},
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontSize: 15.3.sp,
                                                fontWeight: FontWeight.bold,
                                                height: 1.8),
                                        cursorColor: Colors.black,
                                        cursorWidth: 1.4.w,
                                        cursorRadius:
                                            const Radius.circular(555),
                                        decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                            onTap: () {
                                              // vm.isHidingPassword = !vm.isHidingPassword;
                                            },
                                            child: Icon(
                                              Icons.edit_square,
                                              color: Colors.black38,
                                              size: 20,
                                            ),
                                          ),
                                          contentPadding: EdgeInsets.all(0),
                                          fillColor:
                                              Colors.redAccent.withOpacity(.6),
                                          focusedBorder: InputBorder.none,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                          controller: userNameController,
                          hint: lang.tr('userName'),
                          context: context,
                          isEnable: false,
                          keyboardType: TextInputType.text,
                          suffixIcon: Icons.edit_square,
                          onClicked: () {
                            customControllerBottomSheet.text =
                                userNameController.text;
                            bottomSheet(
                              context: context,
                              body: CustomContentBottomSheet(
                                titleAction: 'Username',
                                controller: userNameController,
                                child: Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50.w),
                                    child: Expanded(
                                      child: Center(
                                        child: Container(
                                            child: CustomTextField(
                                          hint: 'Enter your Username',
                                          keyboardType: TextInputType.text,
                                          context: context,
                                          controller:
                                              customControllerBottomSheet,
                                          autofocus: true,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                                onClicked: () async {
                                  if (customControllerBottomSheet
                                      .text.isNotEmpty) {
                                    Get.back();

                                    userNameController.text =
                                        customControllerBottomSheet.text;

                                  } else {
                                    showSnackBar(
                                        context: context,
                                        content: 'Not exsist for editing',
                                        error: true);
                                  }
                                },
                              ),
                            );
                          }),
                      CustomTextFormField(
                          controller: emailController,
                          hint: lang.tr('email'),
                          context: context,
                          isEnable: false,
                          suffixIcon: Icons.edit_square,
                          keyboardType: TextInputType.text,
                          onClicked: () {
                            customControllerBottomSheet.text =
                                emailController.text;
                            bottomSheet(
                              context: context,
                              body: CustomContentBottomSheet(
                                titleAction: 'Email',
                                controller: emailController,
                                child: Expanded(
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 50.w),
                                    child: Expanded(
                                      child: Center(
                                        child: Container(
                                            child: CustomTextField(
                                          hint: 'Enter your email',
                                          keyboardType: TextInputType.text,
                                          context: context,
                                          controller:
                                              customControllerBottomSheet,
                                          autofocus: true,
                                        )),
                                      ),
                                    ),
                                  ),
                                ),
                                onClicked: () async {
                                  if (customControllerBottomSheet
                                      .text.isNotEmpty) {
                                    Get.back();
                                    email = customControllerBottomSheet.text;
                                    emailController.text =
                                        customControllerBottomSheet.text;



                                  } else {
                                    showSnackBar(
                                        context: context,
                                        content: 'Not exsist for editing',
                                        error: true);
                                  }
                                },
                              ),
                            );
                          }),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment,

                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                controller: genderController,
                                hint: 'Gender',
                                suffixIcon: Icons.edit_square,
                                context: context,
                                isEnable: false,
                                keyboardType: TextInputType.text,
                                onClicked: () {
                                  bottomSheet(
                                      context: context,
                                      body: CustomContentBottomSheet(
                                        titleAction: 'Gender',
                                        controller: genderController,
                                        child: Expanded(
                                          child: Center(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 30.w),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(22.r),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              height: 120.h,
                                              child: CupertinoTheme(
                                                data: CupertinoThemeData(
                                                  brightness: Brightness.light,
                                                  textTheme:
                                                      CupertinoTextThemeData(
                                                    dateTimePickerTextStyle:
                                                        TextStyle(
                                                            fontSize: 15.sp,
                                                            color:
                                                                Colors.black),
                                                  ),
                                                ),
                                                child: CupertinoPicker(
                                                    itemExtent: 36,
                                                    onSelectedItemChanged:
                                                        (index) =>
                                                            setState(() async {
                                                              if (index == 0) {
                                                                gender = gender;
                                                              } else {
                                                                gender = gender ==
                                                                        'Male'
                                                                    ? 'Female'
                                                                    : 'Male';
                                                              }
                                                            }),
                                                    children: [
                                                      Center(
                                                          child: Text(gender.isNotEmpty ? gender : 'Male') ),
                                                      Center(
                                                          child: Text(
                                                              gender.isNotEmpty ?  gender == 'Male'
                                                                  ? 'Female'
                                                                  : 'Male' : 'Female'
                                                             )),
                                                    ]),
                                              ),
                                            ),
                                          ),
                                        ),
                                        onClicked: () async {
                                          Get.back();
                                          genderController.text = gender;
                                        },
                                      ));
                                }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: CustomTextFormField(
                                controller: dateBirthController,
                                hint: 'DateBirth',
                                context: context,
                                isEnable: false,
                                suffixIcon: Icons.date_range_rounded,
                                keyboardType: TextInputType.text,
                                onClicked: () {
                                  bottomSheet(
                                      context: context,
                                      body: CustomContentBottomSheet(
                                        titleAction: 'Date Birth',
                                        controller: controller,
                                        child: Expanded(
                                            child: Column(
                                          children: [
                                            CustomDateTimePicker(
                                                oldDataBirth:
                                                  '${ datebirth.isNotEmpty ? dateBirthController.text : DateTime.now()}',
                                                onChenged: (DateTime value) {
                                                  selectedDateTime = value
                                                      .toString()
                                                      .substring(
                                                          0,
                                                          value
                                                              .toString()
                                                              .indexOf(' '));
                                                }),
                                          ],
                                        )),
                                        onClicked: () async {
                                          Get.back();
                                          dateBirthController.text =
                                              selectedDateTime;

                                          // setState(() {
                                          //   dateBirthController.text =
                                          //       selectedDateTime;
                                          // });
                                          //Navigator.pop(context);
                                        },
                                      ));
                                }),
                          ),
                        ],
                      ),
                      CustomTextFormField(
                          controller: passwordController,
                          hint: 'Password',
                          suffixIcon: Icons.edit_square,
                          context: context,
                          isEnable: false,
                          keyboardType: TextInputType.visiblePassword,
                          fieldEdit: 'Password',
                          onClicked: () {
                            bottomSheet(
                              context: context,
                              body: CustomContentBottomSheet(
                                titleAction: 'Password',
                                controller: passwordController,
                                child: Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        right: 50.w, left: 50.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                            child: CustomTextField(
                                                hint: 'Current Password',
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                context: context,
                                                controller:
                                                    currentPasswordController)),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        CustomTextField(
                                            hint: 'New Password',
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            context: context,
                                            controller: newPasswordController),
                                        SizedBox(
                                          height: 15.h,
                                        ),
                                        CustomTextField(
                                            hint: 'Re-Type New Password',
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            context: context,
                                            controller:
                                                reTypeNewPasswordController),
                                      ],
                                    ),
                                  ),
                                ),
                                onClicked: () async {
                                  if (currentPasswordController
                                          .text.isNotEmpty &&
                                      newPasswordController.text.isNotEmpty &&
                                      reTypeNewPasswordController
                                          .text.isNotEmpty) {
                                    if (newPasswordController.text.trim() ==
                                        reTypeNewPasswordController.text
                                            .trim()) {
                                      Get.back();
                                      showLoadingDialog(context);
                                      ApiResponse result =
                                          await UserApiController()
                                              .changePassword(
                                                  currentPassword:
                                                      currentPasswordController
                                                          .text,
                                                  newPassword:
                                                      newPasswordController
                                                          .text,
                                                  newPasswordConfirmation:
                                                      reTypeNewPasswordController
                                                          .text);
                                      if (result.success) {
                                        passwordController.text =
                                            newPasswordController.text;
                                        Get.back();
                                      } else {
                                        Get.back();
                                        showSnackBarByGet(
                                            title: result.message, error: true);
                                      }
                                    } else {
                                      showSnackBarByGet(
                                          title: 'Confirm password not match',
                                          error: true);
                                    }
                                  } else {
                                    showSnackBarByGet(
                                        title: 'Requied data', error: true);
                                  }
                                },
                              ),
                            );
                          }),
                      CustomTextFormField(
                          controller: languageController,
                          hint: 'English',
                          context: context,
                          isEnable: false,
                          suffixIcon: Icons.edit_square,
                          keyboardType: TextInputType.text,
                          onClicked: () {
                            List languagesList = [language];
                            languages.map((item) {
                              if (item != language) {
                                languagesList.add(item);
                              }
                            }).toList();
                            bottomSheet(
                                context: context,
                                body: CustomContentBottomSheet(
                                  titleAction: 'Language',
                                  controller: languageController,
                                  child: Expanded(
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(22.r),
                                        ),
                                        clipBehavior: Clip.antiAlias,
                                        height: 120.h,
                                        child: CupertinoTheme(
                                          data: CupertinoThemeData(
                                            brightness: Brightness.light,
                                            textTheme: CupertinoTextThemeData(
                                              dateTimePickerTextStyle:
                                                  TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black),
                                            ),
                                          ),
                                          child: CupertinoPicker(
                                              itemExtent: 36.h,
                                              onSelectedItemChanged: (index) =>
                                                  language =
                                                      languagesList[index],
                                              children: languagesList
                                                  .map((item) =>
                                                      Center(child: Text(item)))
                                                  .toList()),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onClicked: () {
                                    setState(() {
                                      languageController.text = language;
                                    });
                                  },
                                ));
                          }),
                      CustomContainerPersonalInformation(
                          textWidgit: Text('Light'),
                          rightWidgit: Container(
                            width: 67,
                            height: 32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomStart,
                                    colors: [
                                      Color(0xFF2C8095),
                                      Color(0xFF77EAC3),
                                    ])),
                            child: Row(
                              children: [
                                Container(
                                  width: 28,
                                  height: 28,
                                  margin: EdgeInsets.only(left: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    Icons.light_mode_outlined,
                                    color: primaryColor,
                                  ),
                                ),
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  width: 28,
                                  height: 28,
                                  margin: EdgeInsets.only(left: 2.w),
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Icon(
                                    MyFlutterApp.ri_moon_line,
                                    color: Colors.white,
                                    size: 25.r,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 17.h,
            right: 17.w,
            child: GestureDetector(
              onTap: () {
                save();
              },
              child: Container(
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/icons/FTBPK.png"),
                          fit: BoxFit.cover)),
                  padding: EdgeInsets.only(bottom: 8.h),
                  height: 70.h,
                  width: 70.w,
                  child:
                      //Image.asset('assets/icons/save.png')

                      Icon(
                    MyFlutterApp.save,
                    color: Colors.white,
                  )

                  // Icon(
                  //   Icons.add,
                  //   size: 33.r,
                  //   color: Colors.white,
                  // ),
                  ),
            ),
          ),
        ]));
  }

  void _pickImage() async {
    final imageFile = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: [
          //  CropAspectRatioPreset.square,
          //CropAspectRatioPreset.ratio3x2,
          // CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          // CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: primaryColor,
              toolbarWidgetColor: Colors.white,
              // cropFrameColor: Colors.blue,
              backgroundColor: scaffoldBackGround,
              cropGridColor: secondaryColor,
              activeControlsWidgetColor: primaryColor,
              initAspectRatio: CropAspectRatioPreset.ratio3x2,
              lockAspectRatio: true),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

      setState(() {
        _pickedImage = XFile(croppedFile!.path);
      });
      // _upload(path: croppedFile!.path);

      // final savedFile = File(croppedFile!.path);

      //_pickedImage = imageFile;
      // showReviewToAddImageDialog(croppedFile as File);
      // if(index == -1){
      //   CreateChaletGetxController.to.imageFiles.add(savedFile);
      // }else{
      //   CreateChaletGetxController.to.imageFiles[index] = savedFile;
      //   CreateChaletGetxController.to.isAllowSelect.value = false;
      //   CreateChaletGetxController.to.selectedImageFiles.clear();
      // }
    }
  }

  void save() async {
    showLoadingDialog(context);
    ApiResponse result = await UserApiController().changeField(
        nameKey: 'first_name',
        field: firstNameController.text,
        url: 'user_profile_change_first_name');

    ApiResponse result2 = await UserApiController().changeField(
        nameKey: 'last_name',
        field: lastNameController.text,
        url: 'user_profile_change_last_name');


    ApiResponse result3 =
    await UserApiController().changeField(
        nameKey: 'username',
        field: userNameController
            .text,
        url:
        'user_profile_change_username');



    ApiResponse result4 =
    await UserApiController().changeField(
        nameKey: 'email',
        field: customControllerBottomSheet.text,
        url: 'user_profile_change_email');

    ApiResponse result5 =
    await UserApiController().changeField(
        nameKey: 'gender',
        field: genderController.text,
        url:
        'user_profile_change_gender');



    ApiResponse result6 =
    await UserApiController().changeField(
        nameKey: 'birthday',
        field:
        dateBirthController.text,
        url:
        'user_profile_change_birthday');

    // String pathImage = // 'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2FRectangle%208.png?alt=media&token=e3a66627-7799-4ff4-83a5-d0e832ff8852';
        //'https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=9b7af4ec-a00b-44d7-8061-dc8b57be48ac';

    if(_pickedImage != null){
      ApiResponse apiResponse = await _upload(path: _pickedImage!.path);
      SharedPrefController().editAccountPicture(accountPicture: apiResponse.object);

      //change path image
    }

    // if (result.success) {
    SharedPrefController().editData(firstName: firstName, lastName: lastName, username: userNameController.text,
        email: email,  gender: genderController.text, datebirth:  dateBirthController.text,);
    UserGetxController.to.firstName.value = firstName;
    UserGetxController.to.lastName.value = lastName;
    UserGetxController.to.email.value = email;

    Get.back();
      showSnackBarByGet(title: 'Successfully Save data', error: false);

    //}

  }

  Future<ApiResponse> _upload({required String path}) async {
   // showLoadingDialog(context);

    ApiResponse result =
        await ImageApiController().uploadImageProfile(path: path);
    //Get.back();

    if (result.success) {
      UserGetxController.to.accountPicture.value = result.object;

      // showSnackBarByGet(
      //     title: 'Successfully Changed Image Prifile', error: false);
    } else {
      showSnackBarByGet(title: 'Failed Changed Image Prifile', error: true);
    }
    return result;
  }
}
