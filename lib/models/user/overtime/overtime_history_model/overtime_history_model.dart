// class OvertimeHistoryModel {
//   int ot_id;
//   int status_id;
//   int total;
//   String date;
//   String start_time;
//   String end_time;
//   String ? detail;
//   String ? approved_by;
//   String status;
//
//   OvertimeHistoryModel({
//     required this.ot_id,
//     required this.status_id,
//     required this.total,
//     required this.date,
//     required this.start_time,
//     required this.end_time,
//     required this.detail,
//     required this.approved_by,
//     required this.status,
//
//   });
//
//   factory OvertimeHistoryModel.fromJson(Map<String, dynamic> json) {
//     return OvertimeHistoryModel(
//       ot_id: json['ot_id'] as int,
//       status_id: json['status_id'] as int,
//       total: json['total'] as int,
//       date: json['date'] as String,
//       start_time: json['start_time'] as String,
//       end_time: json['end_time'] as String,
//       detail: json['detail'] as String?,
//       approved_by: json['approved_by'] as String?,
//       status: json['status'] as String,
//     );
//   }
// }



import 'package:freezed_annotation/freezed_annotation.dart';
part   'overtime_history_model.freezed.dart';
part   'overtime_history_model.g.dart';

@freezed
class OvertimeHistoryModel with _$OvertimeHistoryModel {
  const factory OvertimeHistoryModel({
    @JsonKey(name: 'ot_id') required int otID,
    @JsonKey(name: 'status_id') required int statusID,
    required int total,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @Default('-')  String detail,
    @Default('-')  @JsonKey(name: 'approved_by')  String approvedBy,
  }) = _OvertimeHistoryModel;

  factory OvertimeHistoryModel.fromJson(Map<String, dynamic> json) => _$OvertimeHistoryModelFromJson(json);
}

