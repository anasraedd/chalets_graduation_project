import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/context_extetion.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/widgets/admin_widgets/order_notifications_widget.dart';
import 'package:chalets/widgets/admin_widgets/custom_categories_tabs.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    Get.lazyPut<AdminChaletsGetxController>(() => AdminChaletsGetxController());
    AdminChaletsGetxController.to.chaletReservationNotifications();
    super.initState();
  }
  // const NotificationsScreen({Key? key}) : super(key: key);
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
            GetX<AdminChaletsGetxController>(
                init: AdminChaletsGetxController(),
                builder: (AdminChaletsGetxController controller) {
                  return Container(
                    padding: EdgeInsetsDirectional.all(3),
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 38.w),
                    decoration: BoxDecoration(
                        color: Color(0xFFEFF0F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedStatusReservation.value = 0;
                          },
                          child: CustomCategoriesTab(
                            title: 'Pending',
                            isSelected:
                                controller.selectedStatusReservation.value == 0,
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.selectedStatusReservation.value = 1;
                            },
                            child: CustomCategoriesTab(
                              title: 'Accepted',
                              isSelected:
                                  controller.selectedStatusReservation.value ==
                                      1,
                            )),
                        GestureDetector(
                            onTap: () {
                              controller.selectedStatusReservation.value = 2;
                            },
                            child: CustomCategoriesTab(
                              title: 'Completed',
                              isSelected:
                                  controller.selectedStatusReservation.value ==
                                      2,
                            )),
                        GestureDetector(
                            onTap: () {
                              controller.selectedStatusReservation.value = 3;
                            },
                            child: CustomCategoriesTab(
                              title: 'Canceled',
                              isSelected:
                                  controller.selectedStatusReservation.value ==
                                      3,
                            )),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 18.h,
            ),
            Expanded(
                child: GetX<AdminChaletsGetxController>(
                    init: AdminChaletsGetxController(),
                    builder: (AdminChaletsGetxController controller) {
                     if(controller.loadingChaletReservationNotifications.isTrue){
                       return Center(child: CircularProgressIndicator());
                     }else{
                       return Padding(
                         padding: EdgeInsets.all(8.0),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                           child: Scrollbar(
                             trackVisibility: true,
                             interactive: true,
                             thumbVisibility: true,
                             radius: Radius.circular(20),
                             child: ScrollConfiguration(
                               behavior: MyBehavior(),
                               child: controller.selectedStatusReservation.value == 0?
                               ListView.builder(
                                 // physics:
                                 // BouncingScrollPhysics(
                                 //   decelerationRate: ScrollDecelerationRate.fast,
                                 // ),
                                   itemCount: controller.chaletPendingReservations.length,
                                   itemBuilder: (context, index) {
                                     return OrderNotificationsWidget(chaletNotoficationsReservations: controller.chaletPendingReservations[index], reaservationStatus: ReaservationStatus.Pending,);
                                   }): controller.selectedStatusReservation.value == 1?  ListView.builder(
                                 // physics:
                                 // BouncingScrollPhysics(
                                 //   decelerationRate: ScrollDecelerationRate.fast,
                                 // ),
                                   itemCount: controller.chaletAcceptedReservations.length,
                                   itemBuilder: (context, index) {
                                     return OrderNotificationsWidget(chaletNotoficationsReservations: controller.chaletAcceptedReservations[index],  reaservationStatus: ReaservationStatus.Accepted);
                                   }):
                               controller.selectedStatusReservation.value == 2?  ListView.builder(
                                 // physics:
                                 // BouncingScrollPhysics(
                                 //   decelerationRate: ScrollDecelerationRate.fast,
                                 // ),
                                   itemCount: controller.chaletCompletedReservations.length,
                                   itemBuilder: (context, index) {
                                     return OrderNotificationsWidget(chaletNotoficationsReservations: controller.chaletCompletedReservations[index],  reaservationStatus: ReaservationStatus.Completed);
                                   }):  ListView.builder(
                                 // physics:
                                 // BouncingScrollPhysics(
                                 //   decelerationRate: ScrollDecelerationRate.fast,
                                 // ),
                                   itemCount: controller.chaletCanceledReservations.length,
                                   itemBuilder: (context, index) {
                                     return OrderNotificationsWidget(chaletNotoficationsReservations: controller.chaletCanceledReservations[index],  reaservationStatus: ReaservationStatus.Canceled);
                                   }),
                             ),
                           ),
                         ),
                       );
                     }
                    })),
          ],
        ),
      ),
    );
  }
}
