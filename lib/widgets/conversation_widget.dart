import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/get/admin/admin_chalets_getx_Controller.dart';
import 'package:chalets/screens/app_admin/chat_admin_screen.dart';
import 'package:chalets/screens/chat_screen.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
class ConversationWidget extends StatefulWidget {
  late int idSender;
  late String logoOrPicture;
  String nameSender;
  // late String logoSender;
  String lastMessage;
  int numberMessages;
  bool archivedConversation;
  bool laseConvesation;
  String dateMassage;
late bool isLoaded;
late bool isAdmin;

  ConversationWidget(
      {required this.idSender, required this.logoOrPicture, required this.nameSender, required this.lastMessage, required this.numberMessages, this.archivedConversation = false, this.laseConvesation = false, required this.dateMassage
      , this.isLoaded =true, required this.isAdmin});

  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: 11.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 25.w,
            ),
            Container(
              height: 75.h,
              width: 75.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x40000000),
                      offset: Offset(0, 0),
                      blurRadius: 7.5)
                ],
                borderRadius: BorderRadius.circular(55555.w),
              ),
              child: Container(
                  height: 87.w,
                  width: 87.w,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius:
                      BorderRadius.circular(555555.r),
                      // image:  DecorationImage(
                      //   fit: BoxFit.cover,
                      //   image: FadeInImage(
                      //     fit: BoxFit.cover,
                      //     placeholder: AssetImage('assets/placeholder_image.png'), // Replace with your placeholder image path
                      //     image: NetworkImage(widget.urlImage),
                      //   )
                      //
                      // )

                  ),
              child:  widget.isLoaded ? ShimmerLoadingWidget(height: 80.w, width: 80.w): CachedNetworkImage(
                // height: 228.0,
                imageUrl: widget.logoOrPicture,
                fit: BoxFit.fill,
                placeholder: (context, url) => SpinKitFadingCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              ),
              ),

              // CachedNetworkImage(
              //   imageUrl: "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
              //   fit: BoxFit.cover,
              // ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child:  GestureDetector(
                onTap: (){
                  if(widget.isAdmin){
                    Get.to(ChatAdminScreen(userId: widget.idSender, chaletId: AdminChaletsGetxController.to.chaletForManage.value.id, name: widget.nameSender, logo: widget.logoOrPicture, nameMyChalet: AdminChaletsGetxController.to.chaletForManage.value.name, logoMyChalet: AdminChaletsGetxController.to.chaletForManage.value.logo,),);

                  }else{
                    Get.to(ChatScreen(id: widget.idSender, name: widget.nameSender, logo: widget.logoOrPicture,),);

                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //chalet Name
                    widget.isLoaded ? ShimmerLoadingWidget(height: 20.h, width: 100.w, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),) : Text(
                      widget.nameSender,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    //chalet last text
                    widget.isLoaded ? ShimmerLoadingWidget(height: 20.h, width: MediaQuery.of(context).size.width * 0.5, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),): Text(
                      widget.lastMessage,
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: const Color(0xB3505050),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            /*
            widget.archivedConversation ? Text('${widget.dateMassage}', textAlign: TextAlign.center,) : Column(
              children: [
                SizedBox(
                  height: 30.h,

                  child: Text(
                    widget.dateMassage,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                // Container(
                //   height: 25.h,
                //   width: 25.h,
                //   decoration: BoxDecoration(
                //       borderRadius:
                //       BorderRadius.circular(55555),
                //       color: primaryColor),
                //   child: Center(
                //     child: Text(
                //       "${widget.numberMessages}",
                //       style: GoogleFonts.inter(
                //           fontWeight: FontWeight.w400,
                //           fontSize: 13.sp,
                //           color: Colors.white),
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(
              width: 30.w,
            )
            */
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        !widget.laseConvesation
            ? Container(
          height: 1.h,
          margin: EdgeInsets.only(right: 30.w),
          width: 300.w,
          decoration: const BoxDecoration(
            color: Color(0xFFE0E1E3),
          ),
        )
           : Container()
      ],
    );
  }
}
