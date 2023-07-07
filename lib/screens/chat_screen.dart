import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/widgets/actions_chat_screen_bottom_sheet.dart';
import 'package:chalets/widgets/add_discount_code_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  late String urlImage;
  late String nameSender;
  late List<Message> messages;

  ChatScreen(
      {required this.urlImage,
      required this.nameSender,
      required this.messages});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with Helpers{

  final double swipeThreshold = 100; // The distance required for a swipe gesture

  double _startX = 0;

  //late String idMassageIsShow= '';
  bool isShowMessages = false;

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
        leading: Padding(
          padding: EdgeInsetsDirectional.only(start: 30.w),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              MyFlutterApp.back,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        centerTitle: false,
        title: GestureDetector(
          onTap: (){
            bottomSheet(
                context: context,
                body: ActionsChatScreenBottomSheet(isArchive: true, isFavoriteChalet: true, isBlocked: true));
          },
          child: Row(
            children: [
              Container(
                  height: 50.h,
                  width: 50.h,
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
                      borderRadius: BorderRadius.circular(555555.r),
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
                    child: CachedNetworkImage(
                      height: 228.0,
                      imageUrl: widget.urlImage,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => SpinKitFadingCircle(
                        color: Colors.blue,
                        size: 50.0,
                      ),
                    ),
                  )),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.nameSender,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 30.w),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/search.svg')),
          ),
        ],
      ),
      body:
        Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Expanded(
              child: GestureDetector(
                onHorizontalDragStart: (details) {
                  _startX = details.localPosition.dx;
                },
                onHorizontalDragUpdate: (details) {
                  final currentX = details.localPosition.dx;
                  final deltaX = currentX - _startX;

                  if (deltaX < -swipeThreshold) {

                    setState(() {
                      isShowMessages = true;
                    });
                    // Swipe left detected
                    //print('kldmvkldmsvkl');
                    // setState(() {
                    //   idMassageIsShow = widget.messages[index].idMessage;
                    // });
                    // widget.onSwipeLeft();
                  }

                  if (deltaX > swipeThreshold) {
                    setState(() {
                      isShowMessages = false;
                    });
                    // Swipe right detected
                    // if(widget.messages[index].idMessage == idMassageIsShow){
                    //    setState(() {
                    //      idMassageIsShow = '';
                    //    });
                    //  }

                  }
                },
                child: ListView.builder(
                  itemCount: widget.messages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                      child: Column(
mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                        index != 0
                            ? widget.messages[index].dateTimeMessage.day !=
                                    widget.messages[index - 1].dateTimeMessage.day
                                ? Center(
                                    child: Text(
                                      FormatDateTimeMassage.dateMessage(
                                          widget.messages[index].dateTimeMessage),
                                      style: GoogleFonts.inter(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                : Container()
                            : Center(
                                child: Text(
                                  FormatDateTimeMassage.dateMessage(
                                      widget.messages[index].dateTimeMessage),
                                  style: GoogleFonts.inter(
                                      fontSize: 15.sp, fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                        Align(
                          alignment: AlignmentDirectional.topCenter,

                            child: Container(
                              alignment: AlignmentDirectional.topEnd,
width: double.infinity,
                              //margin: EdgeInsetsDirectional.only(start: 200),
                              child: Row(
                                 //mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,


                                children: [

                                     // Visibility(
                                     //    visible: widget.messages[index].idSender != '1' && idMassageIsShow.isNotEmpty && widget.messages[index].idMessage == idMassageIsShow,
                                     //    child: Padding(
                                     //      padding:  EdgeInsets.only(top: 15.h),
                                     //      child: Text('${FormatDateTimeMassage.timeMessage(widget.messages[index].dateTimeMessage)}',),
                                     //    )),
                                  Visibility(
                                      visible: widget.messages[index].idSender != '1' &&  isShowMessages,
                                      child: Padding(
                                        padding:  EdgeInsets.only(top: 15.h),
                                        child: Text('${FormatDateTimeMassage.timeMessage(widget.messages[index].dateTimeMessage)}',),
                                      )),

                                  Expanded(
                                    child: Padding(
                                      padding:  EdgeInsetsDirectional.only(start: 20.w, end: 40.w, top: 5.h),
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment: widget.messages[index].idSender == '1' ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                                            child: ClipPath(

                                                clipper: HexagonalClipper(),
                                                child: Container(
                                                  alignment: AlignmentDirectional.centerStart,
                                                  width: 30.w,
                                                  height: widget.messages[index].textMessage
                                                              .length <=
                                                          23
                                                      ? 41.h
                                                      : 30.h,
                                                  decoration: BoxDecoration(
                                                    color: widget.messages[index].idSender == '1' ? Color(
                                                        0xFF26A9CB)
                                                        : Colors.grey.shade400,
                                                    // Set the background color of the chat bubble
                                                    borderRadius: BorderRadiusDirectional.only(
                                                        topEnd: Radius.circular(8.r),
                                                        bottomEnd: Radius.circular(8.r),
                                                        topStart: Radius.circular(15.r),
                                                        bottomStart: Radius.circular(15.r)),
                                                  ),
                                                )),
                                          ),
                                          Align(
                                            alignment: widget.messages[index].idSender == '1' ? AlignmentDirectional.centerEnd : AlignmentDirectional.centerStart,
                                            child: Container(
                                              margin: EdgeInsetsDirectional.only(start: widget.messages[index].idSender != '1' ? 9.w: 0 ,end: widget.messages[index].idSender == '1' ? 9.w: 0, ),

                                              decoration: BoxDecoration(
                                                color: widget.messages[index].idSender == '1' ? Color(
                                                    0xFF26A9CB)
                                                    : Colors.grey.shade400,
                                                // Set the background color of the chat bubble
                                                borderRadius: BorderRadiusDirectional.only(
                                                    topEnd: Radius.circular(8.r),
                                                    bottomEnd: Radius.circular(8.r),
                                                    topStart: Radius.circular(8.r.r),
                                                    bottomStart: Radius.circular(8.r.r)),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w, vertical: 10.h),
                                              // Add padding inside the chat bubble
                                              child: Text(
                                                widget.messages[index].textMessage,
                                                style: TextStyle(color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                      visible: widget.messages[index].idSender == '1'&&  isShowMessages,
                                      child: Padding(
                                        padding:  EdgeInsets.only(top: 15.h),
                                        child: Text('${FormatDateTimeMassage.timeMessage(widget.messages[index].dateTimeMessage)}',),
                                      )),
                                ],
                              ),
                            ),
                          ),
                      ]),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 43.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                padding: EdgeInsetsDirectional.only(start: 15.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 1),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Type your message here...',
                              hintStyle: GoogleFonts.inter(color: Colors.black38),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        MyFlutterApp.send_message,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        // Implement sending the message functionality
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 26.h,
            )
          ],
        ),

    );
  }
}
