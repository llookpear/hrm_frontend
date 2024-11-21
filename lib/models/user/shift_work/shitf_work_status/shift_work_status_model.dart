// class shiftWorkModel {
//   int roster_id;
//   int staff_id;
//   String fullname;
//   String position;
//   String department;
//   String date;
//   String shift_time;
//
//
//   shiftWorkModel({
//     required this.roster_id,
//     required this.staff_id,
//     required this.fullname,
//     required this.position,
//     required this.department,
//     required this.date,
//     required this.shift_time,
//   });
//
//   factory shiftWorkModel.fromJson(Map<String,dynamic> json) {
//     return shiftWorkModel(
//       roster_id : json['roster_id'] as int,
//       staff_id : json['staff_id'] as int,
//       fullname : json['fullname'] as String,
//       position : json['position'] as String,
//       department : json['department'] as String,
//       date : json['date'] as String,
//       shift_time : json['shift_time'] as String,
//     );
//   }
// }
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_work_status_model.freezed.dart';

part 'shift_work_status_model.g.dart';

@freezed
class ShiftWorkStatusModel with _$ShiftWorkStatusModel {
  const factory ShiftWorkStatusModel({
    @JsonKey(name: 'shift_change_id') required int shiftChangeID,
    required String date,
    @JsonKey(name: 'current_shift') required int currentShift,
    @JsonKey(name: 'current_shift_time') required String currentShiftTime,
    @JsonKey(name: 'desired_shift') required int desiredShift,
    @JsonKey(name: 'desired_shift_time') required String desiredShiftTime,
    @JsonKey(name: 'status_id') required int statusID,
    required String fullName,
    required String position,
    required String department,
    @Default('-') @JsonKey(name: 'approved_by') String approvedBY,
  }) = _ShiftWorkStatusModel;

  factory ShiftWorkStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ShiftWorkStatusModelFromJson(json);
}
