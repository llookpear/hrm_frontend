// class CheckInOutTimeModel {
//   String time;
//
//   CheckInOutTimeModel({required this.time});
//
//   factory CheckInOutTimeModel.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {'time': String time} => CheckInOutTimeModel(time: time),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }

import 'package:freezed_annotation/freezed_annotation.dart';
part   'check_in_out_time_model.freezed.dart';
part   'check_in_out_time_model.g.dart';

@freezed
class CheckInOutTimeModel with _$CheckInOutTimeModel {
  const factory CheckInOutTimeModel({
    @Default('-')  String time,
  }) = _CheckInOutTimeModel;

  factory CheckInOutTimeModel.fromJson(Map<String, Object?> json) =>
      _$CheckInOutTimeModelFromJson(json);
}

