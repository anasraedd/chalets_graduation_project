import 'package:chalets/core/api/admin/admin_chalets_api_controller.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/models/admin/ChaletPendingReservations.dart';
import 'package:chalets/models/api_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

enum ReaservationStatus{Pending, Accepted, Completed, Canceled}
class OrderNotificationsWidget extends StatefulWidget {
  late ChaletNotoficationsReservations chaletNotoficationsReservations;
  late ReaservationStatus reaservationStatus;


  OrderNotificationsWidget(
      {required this.chaletNotoficationsReservations, required this.reaservationStatus});
  @override
  State<OrderNotificationsWidget> createState() => _OrderNotificationsWidgetState();
}

class _OrderNotificationsWidgetState extends State<OrderNotificationsWidget> with Helpers{
 // late String start_at;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 15.h),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            padding: EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Text(
                      'Visitor Data',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.5.sp,
                          color: Colors.black),
                    ),
                    Expanded(child: Container()),
                    widget.reaservationStatus == ReaservationStatus.Pending ?
                    SvgPicture.asset(
                      'assets/icons/calender_directions.svg',
                      color: Color(0xFFFFB703),
                      height: 18,
                      width: 18,
                    ) :  widget.reaservationStatus == ReaservationStatus.Accepted ?   SvgPicture.asset(
                      'assets/icons/accepted.svg',
                      color: Color(0xFF2C8095),
                      height: 18,
                      width: 18,
                    ) :
                    widget.reaservationStatus == ReaservationStatus.Completed ?   SvgPicture.asset(
                      'assets/icons/completed.svg',
                      color: Color(0xFF51D65E),
                      height: 18,
                      width: 18,
                    ) :   SvgPicture.asset(
                      'assets/icons/cancled.svg',
                      color: Color(0xFFE75959),
                      height: 18,
                      width: 18,
                    )
                    ,
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '#${widget.chaletNotoficationsReservations.id}',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.sp,
                          color:  widget.reaservationStatus == ReaservationStatus.Pending ?  Color(0xFFFFB703):
                          widget.reaservationStatus == ReaservationStatus.Accepted ?  Color(0xFF2C8095):
                          widget.reaservationStatus == ReaservationStatus.Completed ?  Color(0xFF51D65E): Color(0xFFE75959) ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      'Name',
                      style: GoogleFonts.inter(fontSize: 15.sp),
                    )),
                    Expanded(
                        child: Text(
                      '${widget.chaletNotoficationsReservations.user.name}',
                      style: GoogleFonts.inter(
                          fontSize: 15.sp, color: secondaryColor),
                    )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Phone Number',
                        style: GoogleFonts.inter(fontSize: 15.sp),
                      )),
                      Expanded(
                          child: Text(
                        '${widget.chaletNotoficationsReservations.user.mobile}',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Check-In Date',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: Colors.green),
                      )),
                      Expanded(
                          child: Text(
                        'Check-In Time',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: Colors.green),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        '${widget.chaletNotoficationsReservations.startAt}',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      Expanded(
                          child: Text(
                        widget.chaletNotoficationsReservations.periodStart == 'Morning' ? '08:00 am' : '07:00 pm',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Check-Out Date',
                        style:
                            GoogleFonts.inter(fontSize: 15.sp, color: Colors.red),
                      )),
                      Expanded(
                          child: Text(
                        'Check-Out Time',
                        style:
                            GoogleFonts.inter(fontSize: 15.sp, color: Colors.red),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h, start: 10.w),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
    '${widget.chaletNotoficationsReservations.endAt}',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      Expanded(
                          child: Text(
    widget.chaletNotoficationsReservations.periodEnd == 'Morning' ? '08:00 am' : '07:00 pm',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: 5.h,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Contact with the Visitor',
                        style: GoogleFonts.inter(
                            fontSize: 15.sp, color: secondaryColor),
                      )),
                      SvgPicture.asset('assets/icons/contact.svg'),
                      SizedBox(
                        width: 15.w,
                      ),
                      SvgPicture.asset('assets/icons/message.svg'),
                      SizedBox(
                        width: 40.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Visibility(
            visible:  widget.reaservationStatus == ReaservationStatus.Pending ,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 60.h,
                    child: ElevatedButton(onPressed: () async {
                      showLoadingDialog(context);
                      ApiResponse apiResponse = await AdminChaletsApiController().chaletReservationChangeStatus(chaletsId: AdminChaletsGetxController.to.chaletForManage.value.id, chaletReservationsId: widget.chaletNotoficationsReservations.id, chaletReservationStatus: ChaletReservationStatus.Canceled);
                      Get.back();
                      if (apiResponse.success) {
                        AdminChaletsGetxController.to.chaletPendingReservations.removeWhere((element) => element.id == widget.chaletNotoficationsReservations.id);
                        AdminChaletsGetxController.to.chaletCanceledReservations.add(widget.chaletNotoficationsReservations);
                        showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);

                      } else {
                        showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);
                      }

                    }, style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,

                    ),child: Text('Cancel', style: GoogleFonts.roboto(
                      fontSize: 17.sp, fontWeight: FontWeight.w700, color: Colors.white
                    ),)),
                  ),
                  SizedBox(width: 15.w,),
                  Expanded(
                    child: SizedBox(
                      // width: 100.w,
                      height: 60.h,
                      child: ElevatedButton(onPressed: () async {
                        showLoadingDialog(context);
                        ApiResponse apiResponse = await AdminChaletsApiController().chaletReservationChangeStatus(chaletsId: AdminChaletsGetxController.to.chaletForManage.value.id, chaletReservationsId: widget.chaletNotoficationsReservations.id, chaletReservationStatus: ChaletReservationStatus.Accepted);
                        Get.back();
                        if (apiResponse.success) {
                          AdminChaletsGetxController.to.chaletPendingReservations.removeWhere((element) => element.id == widget.chaletNotoficationsReservations.id);
                          AdminChaletsGetxController.to.chaletAcceptedReservations.add(widget.chaletNotoficationsReservations);
                          showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);

                        } else {
                          showSnackBarByGet(title: apiResponse.message, error: !apiResponse.success);
                        }

                      }, style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2DC653)// Colors.green,

                      ),child: Text('Accept', style: GoogleFonts.roboto(
                          fontSize: 17.sp, fontWeight: FontWeight.w700, color: Colors.white
                      ),)),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
