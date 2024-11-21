// class leave_quota_model {
//   int quota;
//
//   leave_quota_model({required this.quota});
//
//   factory leave_quota_model.fromJson(Map<String, dynamic> json) {
//     return switch (json) {
//       {'quota': int quota} => leave_quota_model(quota: quota),
//       _ => throw const FormatException('Failed to load'),
//     };
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part   'leave_quota_model.freezed.dart';
part   'leave_quota_model.g.dart';

@freezed
class LeaveQuotaModel with _$LeaveQuotaModel {
  const factory LeaveQuotaModel({
    required int quota,
  }) = _LeaveQuotaModel;

  factory LeaveQuotaModel.fromJson(Map<String, Object?> json) =>
      _$LeaveQuotaModelFromJson(json);
}