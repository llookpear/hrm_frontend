// import 'package:googleapis/calendar/v3.dart' as calendar;
//
// class OTCalendarModel {
//   String date;
//   String startTime;
//   String endTime;
//   String ? eventType;
//
//   OTCalendarModel(
//       {required this.date, required this.startTime, required this.endTime,this.eventType});
//
//   factory OTCalendarModel.fromJson(Map<String, dynamic> json) {
//     return OTCalendarModel(
//       date: json['date'] as String,
//       startTime: json['startTime'] as String,
//       endTime: json['endTime'] as String,
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part   'calendar_model.freezed.dart';
part   'calendar_model.g.dart';

@freezed
class CalendarModel with _$CalendarModel {
  const factory CalendarModel({
    required DateTime date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @Default('-') String eventType,
    @Default('-') String detail,
  }) = _CalendarModel;
  factory CalendarModel.fromJson(Map<String, Object?> json) =>
      _$CalendarModelFromJson(json);
}

