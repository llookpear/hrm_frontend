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

part 'shift_work_model.freezed.dart';
part 'shift_work_model.g.dart';

@freezed
class ShiftWorkModel with _$ShiftWorkModel {
  const factory ShiftWorkModel({
    @JsonKey(name: 'roster_id') required int rosterId,
    @JsonKey(name: 'staff_id') required int staffId,
    @JsonKey(name: 'fullname') required String fullName,
    @JsonKey(name: 'position') required String position,
    @JsonKey(name: 'department') required String department,
    @JsonKey(name: 'date') required String date,
    @JsonKey(name: 'shift_time') required String shiftTime,
  }) = _ShiftWorkModel;

  factory ShiftWorkModel.fromJson(Map<String, dynamic> json) => _$ShiftWorkModelFromJson(json);
}

