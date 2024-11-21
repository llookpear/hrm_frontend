// class OvertimeModel {
//   int ot_id;
//   String title;
//   String firstname;
//   String lastname;
//   String status;
//   String date;
//   String start_time;
//   String end_time;
//   String? detail;
//   String? approved_by;
//
//
//   OvertimeModel({
//     required this.ot_id,
//     required this.title,
//     required this.firstname,
//     required this.lastname,
//     required this.status,
//     required this.date,
//     required this.start_time,
//     required this.end_time,
//     required this.detail,
//     required this.approved_by,
//   });
//
//   factory OvertimeModel.fromJson(Map<String,dynamic> json) {
//     return OvertimeModel(
//       ot_id : json['ot_id'] as int,
//       title : json['title'] as String,
//       firstname : json['firstname'] as String,
//       lastname : json['lastname'] as String,
//       status : json['status'] as String,
//       date : json['date'] as String,
//       start_time : json['start_time'] as String,
//       end_time : json['end_time'] as String,
//       detail : json['detail'] as String?,
//       approved_by : json['approved_by'] as String?,
//     );
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'overtime_model.freezed.dart';

part 'overtime_model.g.dart';

@freezed
class OvertimeModel with _$OvertimeModel {
  const factory OvertimeModel({
    @JsonKey(name: 'ot_id') required int otID,
    required String title,
    required String firstname,
    required String lastname,
    @JsonKey(name: 'status_id') required int statusID,
    required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @Default('-') String detail,
    @Default('-') @JsonKey(name: 'approved_by') String approvedBY,

  }) = _OvertimeModel;

  factory OvertimeModel.fromJson(Map<String, dynamic> json) =>
      _$OvertimeModelFromJson(json);
}
