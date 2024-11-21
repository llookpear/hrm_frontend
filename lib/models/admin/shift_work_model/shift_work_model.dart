import 'package:freezed_annotation/freezed_annotation.dart';

part 'shift_work_model.freezed.dart';

part 'shift_work_model.g.dart';

@freezed
class AdminShiftWorkModel with _$AdminShiftWorkModel {
  const factory AdminShiftWorkModel({
    @JsonKey(name: 'shift_change_id') required int shiftChangeID,
    required String date,
    @JsonKey(name: 'current_shift') required int  requestingShift,
    @JsonKey(name: 'current_shift_time') required String  requestingShiftTime,
    @JsonKey(name: 'requesting_staff_name') required String requestingName,
    @JsonKey(name: 'requesting_staff_position') required String requestingPosition,
    @JsonKey(name: 'requesting_staff_department') required String requestingDepartment,
    @JsonKey(name: 'desired_shift') required int desiredShift,
    @JsonKey(name: 'desired_shift_time') required String desiredShiftTime,
    @JsonKey(name: 'desired_staff_name') required String desiredName,
    @JsonKey(name: 'desired_staff_position') required String desiredPosition,
    @JsonKey(name: 'desired_staff_department') required String desiredDepartment,
    @JsonKey(name: 'status_id') required int statusID,
    @Default('-') @JsonKey(name: 'approved_by') String approvedBY,

  }) = _AdminShiftWorkModel;

  factory AdminShiftWorkModel.fromJson(Map<String, dynamic> json) =>
      _$AdminShiftWorkModelFromJson(json);
}
