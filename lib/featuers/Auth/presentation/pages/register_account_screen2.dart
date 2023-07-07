import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';

class RegisterAccountScreen2 extends StatelessWidget {
  RegisterAccountScreen2({Key? key}) : super(key: key);

  final List<String> list = [
    "(+970) Palestine",
    "(+962) Jorden1",
    "(+971) Ema rat"
  ];
  var value = "(+970) Palestine";
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFE5E5E5),
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
        elevation: 0,
        title: Text(
          'phoneNumber'.tr(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: 330.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(35.r),
                        bottomLeft: Radius.circular(35.r))),
                alignment: Alignment.topCenter,
                child: Image(
                  height: 320.h,
                  image: const AssetImage("assets/images/phoneNumber.png"),
                  fit: BoxFit.cover,
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 440.h,
              margin: EdgeInsets.only(left: 26.w, right: 26.w, top: 185.h),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 378.h,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 34.w, right: 34.w, top: 80.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                child: DropdownButton(
                                  items: list
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 2.w),
                                              child: Text(
                                                e,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.sp,
                                                    ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  onChanged: (value) {},
                                  value: value,
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black,
                                  ),
                                  underline: Container(
                                    width: double.infinity,
                                    height: 1.2.h,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(55)),
                                  ),
                                  isExpanded: true,
                                ),
                              ),
                              SizedBox(
                                height: 26.h,
                              ),
                              Text(
                                'phoneNumber'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp,
                                    ),
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(
                                    color: const Color(0xFFD9D9D9),
                                  ),
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
                                                  "https://s3-alpha-sig.figma.com/img/2fb9/9a98/32fd6f1ccfb613846365244953db836b?Expires=1679270400&Signature=IJDzQa9zIL6ifSVI7u~rzJ0Y3QTWkeh1xXarY4gsQ3A1v9KQERfEgEy5r9q70ITQr3S5zj4Ox~l~N0z4FYvfqdtr72k-Brn3M3WpeL5awhfa4YdfsI~OMUYxw6WJeLlmRdxHA9jPUQS7mJBqcOLd9sEmWmWAjvE5gwaZNEN-lqbVjpUktpuawHc-kFssCEPouFc6H9gdIviLI8F9BNpvfEFd9GOrLRVTyUc5c1mKv82zRfck~SqH4rbm22achYw7PPD-V5c8ZgEGwc9Y8YyUc5FwhuhAFuCN3jjihyXdQei8oUz-7NXz2eSZ5pZVMieKIt9nmoeEcFf6GP1zhn2~9A__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"))),
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
                                            margin: EdgeInsets.only(top: 3.5.h,left: 10 ,right: 2),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              value.split(" ")[0],
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 50.h,
                                              margin: EdgeInsets.only(right: 12.w),

                                              child: TextFormField(

                                                keyboardType:
                                                    TextInputType.phone,
                                                controller: controller,
                                                onChanged: (a) {},
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      fontSize: 15.3.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    height: 1.8
                                                ),
                                                cursorColor: Colors.black,
                                                cursorWidth: 1.4.w,
                                                cursorRadius:
                                                    const Radius.circular(555),
                                                decoration: InputDecoration(
                                                  contentPadding: EdgeInsets.all(0),
                               fillColor: Colors.redAccent.withOpacity(.6),
                                                  focusedBorder:
                                                      InputBorder.none,
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
                              SizedBox(
                                height: 25.h,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 165.w,
                                      alignment: Alignment.center,
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: 'otpText'.tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                              children: [
                                                TextSpan(
                                                  text: 'otp'.tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!,
                                                )
                                              ])),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      'txtCarrierRate'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100.h,
                      width: 100.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(555555.r),
                      ),
                      child: InkWell(
                        child: Container(
                          height: 75.h,
                          width: 75.h,
                          margin: EdgeInsets.all(13.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55555.r),
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400]!,
                                blurRadius: 3,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 40.h,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//                                    Container(
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 12.w),
//                                        alignment: Alignment.centerLeft,
//                                       child: Text(
//                                         value.split(" ")[0],
//                                         textAlign: TextAlign.center,
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineLarge!
//                                             .copyWith(
//                                             fontSize: 15.sp,
//                                             fontWeight:
//                                             FontWeight.bold),
//                                       ),
//                                     ),
//                                     Expanded(
//                                       child: Container(
//                                         height: 50.h,
//                                         alignment: Alignment.center,
//                                         width: double.infinity,
//                                         margin: EdgeInsets.only(
//                                             right: 12.w),
//                                         child: TextFormField(
//                                           maxLength: 10,
//                                           maxLines: 1,
//                                           keyboardType: TextInputType.phone,
//                                           controller: controller,
//                                           onChanged: (a) {},
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodyMedium!
//                                               .copyWith(
//                                                   fontSize: 15.3.sp,
//                                                   fontWeight: FontWeight.bold,),
//                                           cursorColor: Colors.black,
//                                           cursorWidth: 1.4.w,
//                                           cursorHeight: 20.h,
//                                           cursorRadius:
//                                               const Radius.circular(555),
//                                           decoration: InputDecoration(
//                                               counter: Container(),
//                                               focusedBorder: InputBorder.none,
//                                               border: InputBorder.none,
//                                               counterText: "",
// ),
//                                         ),
//                                       ),
//                                     )
