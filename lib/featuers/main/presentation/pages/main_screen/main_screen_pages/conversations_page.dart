
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/core/utils/my_behavior.dart';
import 'package:chalets/get/chat_getx_controller.dart';
import 'package:chalets/widgets/conversation_widget.dart';
import 'package:chalets/widgets/custom_button_material.dart';
import 'package:easy_localization/easy_localization.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/theme/app_theme.dart';

class ConversationsPage extends StatefulWidget {
  bool isAdmin;


  ConversationsPage({this.isAdmin = false});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {

  // ConversationsPage({Key? key}) : super(key: key);
  bool isExsistConversations = true;

  DateTime dateTimeSend = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<ChatGetxController>(() => ChatGetxController());

    ChatGetxController.to.getMyConversation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var lang = AppLocalizations.of(context)!;
    return !isExsistConversations
        ? Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lang.tr('thereNoConversationsSoFar'),
                    style: GoogleFonts.inter(
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFABABAB),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    lang.tr('txtChatOver'),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 17.5.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFABABAB),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Image(
                    image: const AssetImage("assets/images/chatsImage.png"),
                    height: 230.h,
                    width: 280.w,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  SizedBox(
                      width: 150.w,
                      child: CustomButtonMaterial(
                          buttonText: lang.tr('exploreNow'), onTab: () {})),
                ],
              ),
            ),
          )
        : ScrollConfiguration(
            behavior: MyBehavior(),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child:    widget.isAdmin ?  Container(
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
                          lang.tr('conversations'),
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
                ):Container(),),
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
                         lang.tr('txtSearchChat'),
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

                GetX<ChatGetxController>(
                    init: ChatGetxController(),
                    builder: (ChatGetxController controller) {
                      return
                SliverList(


                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ConversationWidget(
                      idSender: controller.loadingConversation.value ? 0 : controller.conversations[index].id,
                        urlImage:  controller.loadingConversation.value ? '' : controller.conversations[index].logo,
                         //   "https://firebasestorage.googleapis.com/v0/b/learning---firebase-flutter.appspot.com/o/forProject%2F-qm2h18.jpg?alt=media&token=e30d4789-7b15-496f-b336-731717c3fc72",
                        nameSender:  controller.loadingConversation.value ? '':controller.conversations[index].name,
                        lastMessage: 'message', // 'Hey!! Text me when you\'re back at home',
                        numberMessages: index + 2,
                      dateMassage: FormatDateTimeMassage.dateTimeMessage(dateTimeSend),
                      isLoaded: controller.loadingConversation.value

                    );
                  },
                  childCount:  controller.loadingConversation.value ? 10 : controller.conversations.value.length, // 1000 list items
                ));})
              ],
            ),
          );
  }
}
