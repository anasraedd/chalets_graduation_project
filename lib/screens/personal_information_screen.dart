import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


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
  final TextEditingController firstNameController = TextEditingController(
    text: 'Anas',
  );

  final TextEditingController lastNameController =
      TextEditingController(text: 'Al Drfeel');

  final TextEditingController phoneNumberController =
      TextEditingController(text: '595508034');

  final TextEditingController userNameController =
      TextEditingController(text: 'anasdrfeel');

  final TextEditingController emailController =
      TextEditingController(text: 'anas@gmail.com');

  final TextEditingController genderController =
      TextEditingController(text: 'Male');

  static TextEditingController dateBirthController =
      TextEditingController(text: '2001-01-02');
  final TextEditingController passwordController =
      TextEditingController(text: '12345678');

  final TextEditingController languageController =
      TextEditingController(text: 'English');

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

  String gender = 'Male';
  String language = 'English';
  String selectedDateTime = '2001-01-02';

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
            "personalInformationScreen".tr(),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
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
                              height: 87.w,
                              width: 87.w,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(555555.r),
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/images/anas.png' ),
                                  ))),
                          GestureDetector(
                            child: Container(
                              height: 34,
                              width: 34,
                              alignment: AlignmentDirectional.bottomEnd,
                              margin: const EdgeInsets.only(top: 50, left: 42),
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
                            'Anas Al Drfeel',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: primaryColor,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'anas.9813@gmail.com',
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
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                //color: Colors.blue,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                              controller: firstNameController,
                              hint: "firstName".tr(),
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
                                    onClicked: () {
                                      if (customControllerBottomSheet
                                          .text.isNotEmpty) {
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
                              hint: 'lastName'.tr(),
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
                                    onClicked: () {
                                      if (customControllerBottomSheet
                                          .text.isNotEmpty) {
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
                                borderRadius: BorderRadius.circular(55555555.r),
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
                                      cursorRadius: const Radius.circular(555),
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
                        hint: 'userName'.tr(),
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
                                        controller: customControllerBottomSheet,
                                        autofocus: true,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              onClicked: () {
                                if (customControllerBottomSheet
                                    .text.isNotEmpty) {
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
                        hint: 'email'.tr(),
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
                                        controller: customControllerBottomSheet,
                                        autofocus: true,
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              onClicked: () {
                                if (customControllerBottomSheet
                                    .text.isNotEmpty) {
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
                                                          color: Colors.black),
                                                ),
                                              ),
                                              child: CupertinoPicker(
                                                  itemExtent: 36,
                                                  onSelectedItemChanged:
                                                      (index) => setState(() {
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
                                                    Center(child: Text(gender)),
                                                    Center(
                                                        child: Text(
                                                            gender == 'Male'
                                                                ? 'Female'
                                                                : 'Male')),
                                                  ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onClicked: () {
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
                              hint: '11/7/2001',
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
                                                  dateBirthController.text,
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
                                      onClicked: () {
                                        setState(() {
                                          dateBirthController.text =
                                              selectedDateTime;
                                        });
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
                                  padding:
                                      EdgeInsets.only(right: 50.w, left: 50.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          child: CustomTextField(
                                              hint: 'Current Password',
                                              keyboardType:
                                                  TextInputType.visiblePassword,
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
                              onClicked: () {},
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
                                            dateTimePickerTextStyle: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black),
                                          ),
                                        ),
                                        child: CupertinoPicker(
                                            itemExtent: 36.h,
                                            onSelectedItemChanged: (index) =>
                                                language = languagesList[index],
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
            onTap: () {},
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
      ]),
    );
  }
}


