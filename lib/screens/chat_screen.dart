import 'package:cached_network_image/cached_network_image.dart';
import 'package:chalets/core/api/chat_api_controller.dart';
import 'package:chalets/core/my_flutter_app_icons.dart';
import 'package:chalets/core/theme/app_theme.dart';
import 'package:chalets/core/utils/format_date_time_massage.dart';
import 'package:chalets/core/utils/helpers.dart';
import 'package:chalets/get/chat_getx_controller.dart';
import 'package:chalets/get/chat_getx_controller.dart';
import 'package:chalets/main.dart';
import 'package:chalets/models/Chat.dart';
import 'package:chalets/models/api_response.dart';
import 'package:chalets/models/message.dart';
import 'package:chalets/prefs/shared_pref_controller.dart';
import 'package:chalets/screens/core/launch_screen.dart';
import 'package:chalets/widgets/actions_chat_screen_bottom_sheet.dart';
import 'package:chalets/widgets/add_discount_code_bottom_sheet.dart';
import 'package:chalets/widgets/shimmer_loading_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {
  late int id;

  ChatScreen({required this.id}); // late String urlImage;


  // late String nameSender;
  // List<Message> messages = [
  //   Message(
  //       idMessage: '1',
  //       idSender: '1',
  //       textMessage: '11111111111111111',
  //       dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
  //   Message(
  //       idMessage: '2',
  //       idSender: '1',
  //       textMessage: '222222222222222222222222222222222222222222',
  //       dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
  //   Message(
  //       idMessage: '3',
  //       idSender: '2',
  //       textMessage:
  //           '33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333',
  //       dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
  //   Message(
  //       idMessage: '4',
  //       idSender: '2',
  //       textMessage: '4444444444444444444444444444',
  //       dateTimeMessage: DateTime.now().subtract(Duration(days: 1))),
  //   Message(
  //       idMessage: '5',
  //       idSender: '2',
  //       textMessage:
  //           '555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555',
  //       dateTimeMessage: DateTime.now()),
  //   Message(
  //       idMessage: '6',
  //       idSender: '1',
  //       textMessage: '66666666666666666666666',
  //       dateTimeMessage: DateTime.now())
  // ];

  //
  // ChatScreen(
  //     {required this.urlImage,
  //     required this.nameSender,
  //     required this.messages});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with Helpers {
  late TextEditingController messageEditingController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    Get.lazyPut<ChatGetxController>(() => ChatGetxController());
    ChatGetxController.to.idChat.value = widget.id;
    ChatGetxController.to.getChat(id: widget.id);
    LaunchScreen.isOpenedChat = true;
    messageEditingController = TextEditingController();


    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _scrollController.jumpTo(_scrollController.position.minScrollExtent);
    // });
    getFcmToken();
    super.initState();
  }

  _ChatScreenState() {
    messageStreamController.listen((message) {
      setState(() {
        if (message.notification != null) {
          Message newMessage = Message();
          newMessage.idMessage = 5289;
          newMessage.messageBy =
          ChatGetxController.to.typeAccount == AccountType.User.name
              ? AccountType.Admin.name
              : AccountType.User.name;
          newMessage.textMessage = '${message.notification?.body}';
          newMessage.dateTimeMessage = DateTime.now();
          List<Message> messages = List.from(ChatGetxController.to.messages)
            ..add(newMessage);

          messages.sort((a, b) =>
              b.dateTimeMessage.compareTo(a.dateTimeMessage));
          showSnackBarByGet(title: '${message.notification?.title}');

          ChatGetxController.to.messages.value = messages;
          // ChatGetxController.to.messages.add(item)
          // _lastMessage = 'Received a notification message:'
          //     '\nTitle=${message.notification?.title},'
          //     '\nBody=${message.notification?.body},'
          //     '\nData=${message.data}';
        } else {
          // Message newMessage =Message();
          // newMessage.idMessage = 58;
          // newMessage.messageBy = '${ChatGetxController.to.typeAccount == AccountType.User.name ? AccountType.Admin.name : AccountType.User.name }';
          // newMessage.textMessage = '${message.notification?.title}';
          // List<Message> messages = List.from( ChatGetxController.to.messages)..add(newMessage);
          //
          // messages.sort((a, b) => b.dateTimeMessage.compareTo(a.dateTimeMessage));

          showSnackBarByGet(title: '${message.notification!.title}');
          // ChatGetxController.to.messages.value = messages;
          // _lastMessage = 'Received a data message: ${message.data}';
        }
      });
    });
  }

  final double swipeThreshold =
  100; // The distance required for a swipe gesture

  double _startX = 0;

  //late String idMassageIsShow= '';
  bool isShowMessages = false;

  void getFcmToken() async {
    String? fcmToken = await FirebaseMessaging
        .instance.getToken();
    print('FcmToken: ${fcmToken} \n Token: ${SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)}');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // قم بتنفيذ الإجراءات المطلوبة عند الرجوع من الشاشة هنا
          print('User pressed back button');
          LaunchScreen.isOpenedChat = false;
          // إرجاع القيمة true للسماح بالرجوع وإغلاق الشاشة الحالية
          return true;
        },
        child: GetX<ChatGetxController>(
            init: ChatGetxController(),
            builder: (ChatGetxController controller) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: primaryColor,
                  shadowColor: primaryColor,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: primaryColor,
                    statusBarIconBrightness: Brightness.light,
                    statusBarBrightness:
                    Brightness.light, // For iOS (dark icons)
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
                      onPressed: () {
                        LaunchScreen.isOpenedChat = false;
                        Get.back();
                      },
                      icon: Icon(
                        MyFlutterApp.back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  centerTitle: false,
                  title: GestureDetector(
                    onTap: () {
                      bottomSheet(
                          context: context,
                          body: ActionsChatScreenBottomSheet(
                              isArchive: true,
                              isFavoriteChalet: true,
                              isBlocked: false,
                          idChalet: controller.chaletInfoChat.value.id,
                            nameChalet: controller.chaletInfoChat.value.name,
                          ));
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
                            child: controller.loadingChat.isTrue
                                ? ShimmerLoadingWidget(
                              height: 87.w,
                              width: 87.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                            )
                                : Container(
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
                              child: CachedNetworkImage(
                                height: 228.0,
                                imageUrl: controller
                                    .chaletInfoChat.value.logo ??
                                    '',
                                fit: BoxFit.fill,
                                placeholder: (context, url) =>
                                    SpinKitFadingCircle(
                                      color: Colors.blue,
                                      size: 50.0,
                                    ),
                              ),
                            )),
                        SizedBox(
                          width: 10.w,
                        ),
                        controller.loadingChat.isTrue
                            ? ShimmerLoadingWidget(height: 20.h, width: 100.w)
                            : SizedBox(
                          width: MediaQuery.of(context).size.width *0.42,
                              child: Text(
                          controller.chaletInfoChat.value.name,
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,

                              fontSize: 20.sp,
                          ),
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
                body: controller.loadingChat.isTrue
                // ? ListView.builder(
                //     itemCount: 30,
                //     itemBuilder: (context, index) {
                //       if (index >= 3 && index <= 6 ||
                //           index >= 11 && index <= 17) {
                //         return Padding(
                //           padding: EdgeInsetsDirectional.only(
                //               start: 20.w, end: 40.w, top: 5.h),
                //           child: Stack(
                //             children: [
                //               Align(
                //                 alignment: AlignmentDirectional.centerStart,
                //                 child: ClipPath(
                //                     clipper: HexagonalClipper(),
                //                     child: ShimmerLoadingWidget(
                //                       width: 30.w,
                //                       height: 30.h,
                //                       decoration: BoxDecoration(
                //                         color: Colors.grey.shade400,
                //                         // Set the background color of the chat bubble
                //                         borderRadius:
                //                             BorderRadiusDirectional.only(
                //                                 topEnd:
                //                                     Radius.circular(8.r),
                //                                 bottomEnd:
                //                                     Radius.circular(8.r),
                //                                 topStart:
                //                                     Radius.circular(15.r),
                //                                 bottomStart:
                //                                     Radius.circular(15.r)),
                //                       ),
                //                     )),
                //               ),
                //               Align(
                //                 alignment: AlignmentDirectional.centerStart,
                //                 child: ShimmerLoadingWidget(
                //                   width: double.infinity,
                //                   height: 30.h,
                //                   margin: EdgeInsetsDirectional.only(
                //                       start: 9.w, end: 0.w),
                //                   decoration: BoxDecoration(
                //                     color: Colors.grey.shade400,
                //                     // Set the background color of the chat bubble
                //                     borderRadius:
                //                         BorderRadiusDirectional.only(
                //                             topEnd: Radius.circular(8.r),
                //                             bottomEnd: Radius.circular(8.r),
                //                             topStart: Radius.circular(15.r),
                //                             bottomStart:
                //                                 Radius.circular(15.r)),
                //                   ),
                //                 ),
                //                 // child: Container(
                //                 //   // margin: EdgeInsetsDirectional.only(start: widget.messages[index].idSender != '1' ? 9.w: 0 ,end: widget.messages[index].idSender == '1' ? 9.w: 0, ),
                //                 //   margin: EdgeInsetsDirectional.only(start:  9.w ,end: 0.w, ),
                //                 //
                //                 //   decoration: BoxDecoration(
                //                 //     color:
                //                 //     // widget.messages[index].idSender == '1' ? Color(
                //                 //     //     0xFF26A9CB)
                //                 //     //     :
                //                 //     Colors.grey.shade400,
                //                 //     // Set the background color of the chat bubble
                //                 //     borderRadius: BorderRadiusDirectional.only(
                //                 //         topEnd: Radius.circular(8.r),
                //                 //         bottomEnd: Radius.circular(8.r),
                //                 //         topStart: Radius.circular(8.r.r),
                //                 //         bottomStart: Radius.circular(8.r.r)),
                //                 //   ),
                //                 //   padding: EdgeInsets.symmetric(
                //                 //       horizontal: 20.w, vertical: 10.h),
                //                 //   // Add padding inside the chat bubble
                //                 //   // child: Text(
                //                 //   //   widget.messages[index].textMessage,
                //                 //   //   style: TextStyle(color: Colors.black),
                //                 //   // ),
                //                 // ),
                //               ),
                //             ],
                //           ),
                //         );
                //       } else {
                //         return Padding(
                //             padding: EdgeInsetsDirectional.only(
                //                 start: 40.w, end: 20.w, top: 15.h),
                //             child: Stack(children: [
                //               Align(
                //                 alignment: AlignmentDirectional.centerEnd,
                //                 child: ClipPath(
                //                     clipper: HexagonalClipper(),
                //                     child: Container(
                //                       // baseColor: Color(0xFF26A9CB),
                //                       width: 30.w,
                //                       height: 30.h,
                //                       decoration: BoxDecoration(
                //                         color: Color(0xFF26A9CB),
                //                         // Set the background color of the chat bubble
                //                         borderRadius:
                //                             BorderRadiusDirectional.only(
                //                                 topEnd:
                //                                     Radius.circular(8.r),
                //                                 bottomEnd:
                //                                     Radius.circular(8.r),
                //                                 topStart:
                //                                     Radius.circular(15.r),
                //                                 bottomStart:
                //                                     Radius.circular(15.r)),
                //                       ),
                //                     )),
                //               ),
                //               Align(
                //                 alignment: AlignmentDirectional.centerEnd,
                //                 child: ShimmerLoadingWidget(
                //                   margin: EdgeInsetsDirectional.only(
                //                       start: 0.w, end: 9.w),
                //                   width: double.infinity,
                //                   height: 30.h,
                //                   baseColor: Color(0xFF26A9CB),
                //                   decoration: BoxDecoration(
                //                     color: Color(0xFF26A9CB),
                //                     // Set the background color of the chat bubble
                //                     borderRadius:
                //                         BorderRadiusDirectional.only(
                //                             topEnd: Radius.circular(15.r),
                //                             bottomEnd:
                //                                 Radius.circular(15.r),
                //                             topStart: Radius.circular(8.r),
                //                             bottomStart:
                //                                 Radius.circular(8.r)),
                //                   ),
                //                 ),
                //               )
                //             ]));
                //         // child: Container(
                //         //   // margin: EdgeInsetsDirectional.only(start: widget.messages[index].idSender != '1' ? 9.w: 0 ,end: widget.messages[index].idSender == '1' ? 9.w: 0, ),
                //         //   margin: EdgeInsetsDirectional.only(start:  9.w ,end: 0.w, ),
                //         //
                //         //   decoration: BoxDecoration(
                //         //     color:
                //         //     // widget.messages[index].idSender == '1' ? Color(
                //         //     //     0xFF26A9CB)
                //         //     //     :
                //         //     Colors.grey.shade400,
                //         //     // Set the background color of the chat bubble
                //         //     borderRadius: BorderRadiusDirectional.only(
                //         //         topEnd: Radius.circular(8.r),
                //         //         bottomEnd: Radius.circular(8.r),
                //         //         topStart: Radius.circular(8.r.r),
                //         //         bottomStart: Radius.circular(8.r.r)),
                //         //   ),
                //         //   padding: EdgeInsets.symmetric(
                //         //       horizontal: 20.w, vertical: 10.h),
                //         //   // Add padding inside the chat bubble
                //         //   // child: Text(
                //         //   //   widget.messages[index].textMessage,
                //         //   //   style: TextStyle(color: Colors.black),
                //         //   // ),
                //         // ),
                //       }
                //     })
                    ? Center(child: CircularProgressIndicator())
                    : Column(
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
                          itemCount: controller.messages.length,
                          controller: _scrollController,
                          reverse: true,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 14.h),
                              child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.end,
                                  children: [
                                    index != 0
                                        ? controller.messages.value[index]
                                        .dateTimeMessage.day !=
                                        controller.messages.value[index - 1]
                                            .dateTimeMessage.day
                                        ? Center(
                                      child: Text(
                                        FormatDateTimeMassage
                                            .dateMessage(
                                            controller.messages.value[index]
                                                .dateTimeMessage),
                                        style:
                                        GoogleFonts.inter(
                                            fontSize: 15.sp,
                                            fontWeight:
                                            FontWeight
                                                .w400),
                                        textAlign:
                                        TextAlign.center,
                                      ),
                                    )
                                        : Container()
                                        : Center(
                                      child: Text(
                                        FormatDateTimeMassage
                                            .dateMessage(
                                            controller.messages.value[index]
                                                .dateTimeMessage),
                                        style: GoogleFonts.inter(
                                            fontSize: 15.sp,
                                            fontWeight:
                                            FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                      AlignmentDirectional.topCenter,
                                      child: Container(
                                        alignment:
                                        AlignmentDirectional.topEnd,
                                        width: double.infinity,
                                        //margin: EdgeInsetsDirectional.only(start: 200),
                                        child: Row(
                                          //mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                          children: [
                                            // Visibility(
                                            //    visible: widget.messages[index].idSender != '1' && idMassageIsShow.isNotEmpty && widget.messages[index].idMessage == idMassageIsShow,
                                            //    child: Padding(
                                            //      padding:  EdgeInsets.only(top: 15.h),
                                            //      child: Text('${FormatDateTimeMassage.timeMessage(widget.messages[index].dateTimeMessage)}',),
                                            //    )),
                                            Visibility(
                                                visible: controller.messages
                                                    .value[index].messageBy !=
                                                    controller.typeAccount
                                                        .value &&
                                                    isShowMessages,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      top: 15.h),
                                                  child: Text(
                                                    '${FormatDateTimeMassage
                                                        .timeMessage(
                                                        controller.messages
                                                            .value[index]
                                                            .dateTimeMessage)}',
                                                  ),
                                                )),

                                            Expanded(
                                              child: Padding(
                                                padding:
                                                EdgeInsetsDirectional
                                                    .only(
                                                    start: 20.w,
                                                    end: 40.w,
                                                    top: 5.h),
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment: controller
                                                          .messages.value[index]
                                                          .messageBy ==
                                                          controller.typeAccount
                                                              .value
                                                          ? AlignmentDirectional
                                                          .centerEnd
                                                          : AlignmentDirectional
                                                          .centerStart,
                                                      child: ClipPath(
                                                          clipper:
                                                          HexagonalClipper(),
                                                          child:
                                                          Container(
                                                            alignment:
                                                            AlignmentDirectional
                                                                .centerStart,
                                                            width: 30.w,
                                                            height: controller
                                                                .messages
                                                                .value[index]
                                                                .textMessage
                                                                .length <=
                                                                46
                                                                ? 36.h
                                                                : 30.h,
                                                            decoration:
                                                            BoxDecoration(
                                                              color: controller
                                                                  .messages
                                                                  .value[index]
                                                                  .messageBy ==
                                                                  controller
                                                                      .typeAccount
                                                                      .value
                                                                  ? Color(
                                                                  0xFF26A9CB)
                                                                  : Colors
                                                                  .grey
                                                                  .shade400,
                                                              // Set the background color of the chat bubble
                                                              borderRadius: BorderRadiusDirectional
                                                                  .only(
                                                                  topEnd: Radius
                                                                      .circular(
                                                                      8
                                                                          .r),
                                                                  bottomEnd:
                                                                  Radius
                                                                      .circular(
                                                                      8
                                                                          .r),
                                                                  topStart:
                                                                  Radius
                                                                      .circular(
                                                                      15
                                                                          .r),
                                                                  bottomStart:
                                                                  Radius
                                                                      .circular(
                                                                      15.r)),
                                                            ),
                                                          )),
                                                    ),
                                                    Align(

                                                      alignment: controller
                                                          .messages.value[index]
                                                          .messageBy ==
                                                          controller.typeAccount
                                                              .value
                                                          ? AlignmentDirectional
                                                          .centerEnd
                                                          : AlignmentDirectional
                                                          .centerStart,
                                                      child: Container(
                                                        height:controller.messages
                                                          .value[index]
                                                          .textMessage
                                                          .length <=
                                                        46
                                                        ? 36.h: null,
                                                        margin:
                                                        EdgeInsetsDirectional
                                                            .only(
                                                          start: controller
                                                              .messages
                                                              .value[index]
                                                              .messageBy !=
                                                              controller
                                                                  .typeAccount
                                                                  .value
                                                              ? 9.w
                                                              : 0,
                                                          end: controller
                                                              .messages
                                                              .value[index]
                                                              .messageBy !=
                                                              controller.myId
                                                                  .value
                                                              ? 9.w
                                                              : 0,
                                                        ),

                                                        decoration:
                                                        BoxDecoration(
                                                          color: controller
                                                              .messages
                                                              .value[index]
                                                              .messageBy ==
                                                              controller
                                                                  .typeAccount
                                                                  .value
                                                              ? Color(
                                                              0xFF26A9CB)
                                                              : Colors
                                                              .grey
                                                              .shade400,
                                                          // Set the background color of the chat bubble
                                                          borderRadius: BorderRadiusDirectional
                                                              .only(
                                                              topEnd: Radius
                                                                  .circular(8
                                                                  .r),
                                                              bottomEnd: Radius
                                                                  .circular(8
                                                                  .r),
                                                              topStart: Radius
                                                                  .circular(8
                                                                  .r
                                                                  .r),
                                                              bottomStart:
                                                              Radius.circular(8
                                                                  .r
                                                                  .r)),
                                                        ),
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            horizontal:
                                                            10.w,
                                                            vertical:
                                                            5.h),
                                                        // Add padding inside the chat bubble
                                                        child: Text(
                                                          controller.messages
                                                              .value[index]
                                                              .textMessage!,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                                visible: controller.messages
                                                    .value[index].messageBy ==
                                                    controller.typeAccount
                                                        .value &&
                                                    isShowMessages,
                                                child: Padding(
                                                  padding:
                                                  EdgeInsets.only(
                                                      top: 15.h),
                                                  child: Text(
                                                    '${FormatDateTimeMassage
                                                        .timeMessage(
                                                        controller.messages
                                                            .value[index]
                                                            .dateTimeMessage)}',
                                                  ),
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
                        // height: 43.h,
                        margin: EdgeInsets.symmetric(horizontal: 25.w),
                        padding: EdgeInsetsDirectional.only(start: 15.w),
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: Colors.black26, width: 1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment:
                                AlignmentDirectional.centerStart,
                                child: TextField(
                                  controller: messageEditingController,
                                  maxLines: 6,
                                  minLines: 1,

                                  decoration: InputDecoration(
                                      hintText:
                                      'Type your message here...',
                                      hintStyle: GoogleFonts.inter(
                                          color: Colors.black38),
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
                              onPressed: () async {
                                String? fcmToken = await FirebaseMessaging
                                    .instance.getToken();

                                print('FcmToken: ${fcmToken} \n Token: ${SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)}');
                                if (messageEditingController
                                    .text.isNotEmpty) {
                                  Message message = Message();
                                  message.idMessage = 228;
                                  message.messageBy =
                                  '${controller.typeAccount.value}';
                                  message.textMessage =
                                      messageEditingController.text;
                                  message.dateTimeMessage = DateTime.now();

                                  List<Message> messages = List.from(
                                      controller.messages)
                                    ..add(message);

                                  messages.sort((a, b) =>
                                      b.dateTimeMessage.compareTo(
                                          a.dateTimeMessage));

                                  controller.messages.value = messages;
                                  //controller.messages.add(message);

                                  _scrollController.animateTo(
                                    _scrollController.position.minScrollExtent,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                  // String message = messageEditingController.text;
                                  messageEditingController.clear();
                                  ApiResponse result = await controller
                                      .sendMessage(
                                      id: widget.id,
                                      message: message.textMessage);
                                  if (result.success) {
                                    String? fcmToken = await FirebaseMessaging
                                        .instance.getToken();

                                    ChatApiController().sendPushMessage(
                                        title: '${SharedPrefController()
                                            .getValueFor<String>(
                                            key: PrefKeys.firstName
                                                .name)} ${SharedPrefController()
                                            .getValueFor<String>(
                                            key: PrefKeys.lastName.name)}',
                                        body: message.textMessage,
                                        token: 'cWXO5tsBRKi1KpNJB8qlwt:APA91bHx1_o-ScmRZqTHuwQRNUEgaRihcUPdQ68s8EB4JaqG5Zzm6iaOoc_ygcuO8svvcvnIZm66UNL26a5omFFzURrUB_TUnK1L0WlfgiRbyL8QlKQB9XojOOyjRdu8sINNOecnF-Fs');
                                  }

                                  ChaletInfoChat newConversations = ChaletInfoChat();
                                  newConversations.id = controller.chaletInfoChat.value.id;
                                  newConversations.name = controller.chaletInfoChat.value.name;
                                  newConversations.logo = controller.chaletInfoChat.value.logo;

                                  // controller.conversations.add(newConversations);
                                 if(!controller.conversations.any((person) => person.id == newConversations.id)) {
                                   controller.conversations.add(newConversations);
                                  /// change for list sorted and assigned
                                }
                                 // controller.conversations.where((p0) => p0.id != controller.chaletInfoChat.value.id);

                                  showSnackBarByGet(title: '${result.message}',
                                      error: !result.success);
// setState(() {
//
// });
                                }
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
            }));
  }


}
