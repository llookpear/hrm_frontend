import 'package:easy_localization/easy_localization.dart';
import 'package:intl/intl.dart';

class ConvertDateTime {

  String convertTime(String time) {
    DateTime parseTime = DateFormat('HH:mm:ss').parse(time);
    String formattedTime = DateFormat('hh:mm a').format(parseTime);
    return formattedTime;
  }

  String convertTimeHHmm(String time){
    DateTime parsedTime = DateFormat('HH:mm:ss').parse(time);
    String formattedTime = DateFormat('HH:mm').format(parsedTime);
    return formattedTime;
  }

  String convertDateddMMMMyyyy(String date) {
    DateTime parseDate = DateTime.parse(date);
    DateTime localDate = parseDate.toLocal();
    String formattedDate = DateFormat('dd MMMM yyyy').format(localDate);
    return formattedDate;
  }

  DateTime convertDateYyyyMmDd(String date) {
    DateTime parseDate = DateTime.parse(date).toUtc();
    DateTime localDate = parseDate.toLocal();
    return DateTime.utc(localDate.year, localDate.month, localDate.day);
  }

  String convertDateDdMmYyyy(String date) {
    DateTime parseDate= DateTime.parse(date);
    DateTime localDate = parseDate.toLocal();
    String formattedDate = DateFormat('dd/MM/yyyy').format(localDate);
    return formattedDate;
  }

  String convertDateEeDdMmm(String date) {
    DateTime parseDate= DateTime.parse(date);
    DateTime localDate = parseDate.toLocal();
    String formattedDate = DateFormat('EEE, d MMM').format(localDate);
    return formattedDate;
  }
  String convertDateMMM(String date) {
    DateTime parseDate= DateTime.parse(date);
    DateTime localDate = parseDate.toLocal();
    String formattedDate = DateFormat('MMMM').format(localDate);
    return formattedDate;
  }

  convertNumberFormat(double total) {
    final numberFormat = NumberFormat('##,###,##0.00');
    final format = numberFormat.format(total);
    return format;
  }

  static DateTime? parseTime(String timeString) {
    final now = DateTime.now();

    timeString = timeString.trim().toLowerCase();
    bool isPm = timeString.endsWith('pm');
    bool isAm = timeString.endsWith('am');
    timeString = timeString.replaceAll('am', '').replaceAll('pm', '').trim();
    final parts = timeString.split(':');
    if (parts.length == 2) {
      int hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);
      if (isPm && hours < 12) {
        hours += 12;
      } else if (isAm && hours == 12) {
        hours = 0;
      }
      return DateTime(now.year, now.month, now.day, hours, minutes);
    }

    return null;
  }

  // static String createdAt() {
  //   var datetime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  //   return datetime;
  // }
  // static String timeNow() {
  //   var time = DateFormat('HH:mm:ss').format(DateTime.now());
  //   return time;
  // }
  // static String dateNow() {
  //   var date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  //   return date;
  // }

  static String createdAt =  DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  static String timeNow = DateFormat('HH:mm:ss').format(DateTime.now());
  static String dateNow = DateFormat('yyyy-MM-dd').format(DateTime.now());
}


