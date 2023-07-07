
import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class FormatDateTimeMassage{

  static String dateTimeMessage(DateTime dateTime) {
    if ( dateTime.day == DateTime.now().day && dateTime.hour == DateTime.now().hour &&
        dateTime.minute == DateTime.now().minute
        && dateTime.isBefore(dateTime.add(Duration(minutes: 1)
        )
        )
    //&& dateTime.second == DateTime.now().second
    ){
      return 'now'.tr();
    }else
    if (dateTime.day == DateTime.now().day) {
      return 'Today\n' + DateFormat('HH:mm a').format(DateTime.now());
    }  if (dateTime.day == DateTime.now().subtract(Duration(days: 1)).day) {
      return 'Yesterday\n' + DateFormat('HH:mm a').format(DateTime.now());
    }  else{
      return DateFormat('MM/dd yyyy').format(dateTime);
    }
  }


  static String dateMessage(DateTime dateTime) {

    if (dateTime.day == DateTime.now().day) {
      return 'Today';
    }  if (dateTime.day == DateTime.now().subtract(Duration(days: 1)).day) {
      return 'Yesterday\n' + DateFormat('MM/dd yyyy').format(DateTime.now());
    }  else{
      return DateFormat('MM/dd yyyy').format(dateTime);
    }
  }

  static String timeMessage(DateTime dateTime) {
    if ( dateTime.day == DateTime.now().day && dateTime.hour == DateTime.now().hour &&
        dateTime.minute == DateTime.now().minute
        && dateTime.isBefore(dateTime.add(Duration(minutes: 1)
        )
        )
    //&& dateTime.second == DateTime.now().second
    ){
      return 'now'.tr();
    } else{
      return DateFormat('HH:mm').format(dateTime);
    }
  }

}