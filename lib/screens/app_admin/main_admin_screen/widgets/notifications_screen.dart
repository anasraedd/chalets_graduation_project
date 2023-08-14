import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/widgets/admin_widgets/order_notifications_widget.dart';
import 'package:chalets/widgets/admin_widgets/custom_categories_tabs.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    context.settingsStatusBarInScreen(color: Colors.transparent, isDark: true);
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 100.h,
              margin: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(0.r)),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/images/app_bar.svg'),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        lang.tr('order_notifications'),
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              padding: EdgeInsetsDirectional.all(3),
              width: double.infinity,
              margin: EdgeInsetsDirectional.symmetric(horizontal: 38.w),
              decoration: BoxDecoration(
                  color: Color(0xFFEFF0F4),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomCategoriesTab(
                    title: 'Pending',
                    isSelected: true,
                  ),
                  CustomCategoriesTab(title: 'Accepted'),
                  CustomCategoriesTab(title: 'Completed'),
                  CustomCategoriesTab(title: 'Canceled'),
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Scrollbar(
                   trackVisibility: true,
                    interactive: true,
                    thumbVisibility: true,
                    radius: Radius.circular(20),
                      child: ScrollConfiguration(
                        behavior: MyBehavior(),
                        child: ListView.builder(
                            // physics:
                            // BouncingScrollPhysics(
                            //   decelerationRate: ScrollDecelerationRate.fast,
                            // ),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return OrderNotificationsWidget();
                            }),
                      ),
                    ),
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
