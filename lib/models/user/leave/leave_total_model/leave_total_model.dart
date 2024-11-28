// class LeaveTotalModel {
//   int total;
//
//   LeaveTotalModel({required this.total});
//
//   factory LeaveTotalModel.fromJson(Map<String, Object> json) {
//     return switch (json) {
//       {'total': int total} => LeaveTotalModel(total: total),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }



import 'package:freezed_annotation/freezed_annotation.dart';
part 'leave_total_model.freezed.dart';
part 'leave_total_model.g.dart';

@freezed
class LeaveTotalModel with _$LeaveTotalModel {
  LeaveTotalModel._();

  factory LeaveTotalModel({
    @Default("0")  String total,

  }) = _LeaveTotalModel;

  factory LeaveTotalModel.fromJson(Map<String, Object?> json) =>
      _$LeaveTotalModelFromJson(json);
}