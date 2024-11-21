// class CheckInOutTotalModel {
//   int total;
//
//   CheckInOutTotalModel({required this.total});
//
//   factory CheckInOutTotalModel.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {'total': int total} => CheckInOutTotalModel(total: total),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }
//

import 'package:freezed_annotation/freezed_annotation.dart';
part   'check_in_out_total_model.freezed.dart';
part   'check_in_out_total_model.g.dart';

@freezed
class CheckInOutTotalModel with _$CheckInOutTotalModel {
  const factory CheckInOutTotalModel({

    @JsonKey(name:'check_in')  @Default(0) int checkIn,
    @JsonKey(name:'check_out')  @Default(0) int checkOut,
    @JsonKey(name:'work_days')  @Default(20) int workDay,
  }) = _CheckInOutTotalModel;

  factory CheckInOutTotalModel.fromJson(Map<String, Object?> json) =>
      _$CheckInOutTotalModelFromJson(json);
}
