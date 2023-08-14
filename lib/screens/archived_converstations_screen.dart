import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/widgets/conversation_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/utils/my_behavior.dart';

class ArchivedConverstationsScreen extends StatefulWidget {
  const ArchivedConverstationsScreen({Key? key}) : super(key: key);

  @override
  State<ArchivedConverstationsScreen> createState() =>
      _ArchivedConverstationsScreenState();
}

class _ArchivedConverstationsScreenState
    extends State<ArchivedConverstationsScreen> {
  DateTime dateTimeSend = DateTime.now();
  @override
  Widget build(BuildContext context) {
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
            bottomLeft: Radius.circular(35.r),
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            MyFlutterApp.back,
            color: Colors.white,
            size: 30,
          ),
        ),
        title: Text(
          'archivedconversations'.tr(),
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 25.sp,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 55.h,
                margin: EdgeInsets.only(
                    left: 80.w, right: 80.w, top: 18.h, bottom: 22.h),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/serchTFF.png"))),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'txtSearchChat'.tr(),
                      style: GoogleFonts.inter(
                          color: primaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Icon(
                      Icons.search_rounded,
                      color: primaryColor,
                      size: 20.r,
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                decoration: const BoxDecoration(
                  color: Color(0xFFE0E1E3),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 35.h,
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // return ConversationWidget(
                //   urlImage:
                //       "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
                //   nameSender: 'White Chalet',
                //   lastMessage: 'Hey!! Text me when you\'re back at home',
                //   numberMessages: index + 2,
                //   dateMassage: FormatDateTimeMassage.dateTimeMessage(dateTimeSend),
                //   archivedConversation: true,
                // );
              },
              childCount: 3, // 1000 list items
            )),
          ],
        ),
      ),
    );
  }

}
