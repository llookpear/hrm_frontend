// class LeaveModel {
//   int leaveId;
//   String title;
//   String firstname;
//   String lastname;
//   String type;
//   String status;
//   String startDate;
//   String endDate;
//   String startTime;
//   String endTime;
//   int total;
//   String? detail;
//   String? image;
//   String? approvedBy;
//
//
//   LeaveModel({
//     required this.leaveId,
//     required this.title,
//     required this.firstname,
//     required this.lastname,
//     required this.type,
//     required this.status,
//     required this.startDate,
//     required this.endDate,
//     required this.startTime,
//     required this.endTime,
//     required this.total,
//     required this.detail,
//     required this.image,
//     required this.approvedBy,
//   });
//
//   factory LeaveModel.fromJson(Map<String,dynamic> json) {
//     return LeaveModel(
//       leaveId : json['leave_id'] as int,
//       title : json['title'] as String,
//       firstname : json['firstname'] as String,
//       lastname : json['lastname'] as String,
//       type : json['type'] as String,
//       status : json['status'] as String,
//       startDate : json['start_date'] as String,
//       endDate : json['end_date'] as String,
//       startTime : json['start_time'] as String,
//       endTime : json['end_time'] as String,
//       total : json['total'] as int,
//       detail : json['detail'] as String?,
//       image : json['image'] as String?,
//       approvedBy : json['approved_by'] as String?,
//     );
//   }
// }
//
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_model.freezed.dart';

part 'leave_model.g.dart';

@freezed
class LeaveModel with _$LeaveModel {
   const factory LeaveModel({
    @JsonKey(name: 'leave_id') required int leaveID,
    required String title,
    required String firstname,
    required String lastname,
    required int type,
    @JsonKey(name: 'status_id') required int statusID,
    @Default('-')  String detail,
    @JsonKey(name: 'start_date') required String startDate,
    @JsonKey(name: 'end_date') required String endDate,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    required int total,
    @Default('-')  String file,
    @Default('-') @JsonKey(name: 'approved_by') String approvedBY,
  }) = _LeaveModel;

  factory LeaveModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveModelFromJson(json);
}
