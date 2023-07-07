import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
class ConversationWidget extends StatefulWidget {
  late String urlImage;
  String nameSender;
  String lastMessage;
  int numberMessages;
  bool archivedConversation;
  String dateMassage;


  ConversationWidget(
      {required this.urlImage, required this.nameSender, required this.lastMessage, required this.numberMessages, this.archivedConversation = false, required this.dateMassage
      });

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
              child:   CachedNetworkImage(
                height: 228.0,
                imageUrl: widget.urlImage,
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
              width: 16.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //chalet Name
                  Text(
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
                  Text(
                    widget.lastMessage,
                    style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        color: const Color(0xB3505050),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
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
                Container(
                  height: 25.h,
                  width: 25.h,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(55555),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      "${widget.numberMessages}",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 13.sp,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 30.w,
            )
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        widget.numberMessages != 2
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
