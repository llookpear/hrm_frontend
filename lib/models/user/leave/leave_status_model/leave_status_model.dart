// class leveDetailModel {
//   int leave_id;
//   String type;
//   String status;
//   String start_date;
//   String end_date;
//   String start_time;
//   String end_time;
//   String? detail;
//   String? image;
//   String? approved_by;
//
//
//   leveDetailModel({
//     required this.leave_id,
//     required this.type,
//     required this.status,
//     required this.start_date,
//     required this.end_date,
//     required this.start_time,
//     required this.end_time,
//     required this.detail,
//     required this.image,
//     required this.approved_by,
//   });
//
//   factory leveDetailModel.fromJson(Map<String,dynamic> json) {
//     return leveDetailModel(
//       leave_id : json['leave_id'] as int,
//       type : json['type'] as String,
//       status : json['status'] as String,
//       start_date : json['start_date'] as String,
//       end_date : json['end_date'] as String,
//       start_time : json['start_time'] as String,
//       end_time : json['end_time'] as String,
//       detail : json['detail'] as String?,
//       image : json['image'] as String?,
//       approved_by : json['approved_by'] as String?,
//
//     );
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'leave_status_model.freezed.dart';
part 'leave_status_model.g.dart';

@freezed
class LeaveStatusModel with _$LeaveStatusModel {
  LeaveStatusModel._();
  factory LeaveStatusModel({
    @JsonKey(name:'leave_id') required int leaveID,
    required int type,
    @JsonKey(name:'status_id')required int statusID,
    @JsonKey(name:'start_date') required String startDate,
    @JsonKey(name:'end_date') required String endDate,
    @Default('-')  String  detail,
    @Default('-')  String file,
    @Default('-')  @JsonKey(name: 'approved_by')  String approvedBy,
    @JsonKey(name:'start_time') required String startTime,
    @JsonKey(name:'end_time') required String endTime,

  }) = _LeaveStatusModel;

  factory LeaveStatusModel.fromJson(Map<String, Object?> json) =>
      _$LeaveStatusModelFromJson(json);
}