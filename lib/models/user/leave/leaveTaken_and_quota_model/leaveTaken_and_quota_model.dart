// class leveTakenAndQuotaModel {
//   int quota;
//   String type;
//   int leave_taken;
//
//   leveTakenAndQuotaModel({required this.quota,required this.type,required this.leave_taken});
//
//   factory leveTakenAndQuotaModel.fromJson(Map<String,dynamic> json) {
//     return leveTakenAndQuotaModel(
//       quota: json['quota'] as int,
//       type: json['type'] as String,
//       leave_taken: json['leave_taken'] as int,
//     );
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part   'leaveTaken_and_quota_model.freezed.dart';
part   'leaveTaken_and_quota_model.g.dart';

@freezed
class LeaveTakenAndQuotaModel with _$LeaveTakenAndQuotaModel {
  const factory LeaveTakenAndQuotaModel({
    required int quota,
    required int type,
    @Default("0") @JsonKey(name: 'leave_taken') String leaveTaken,
  }) = _LeaveTakenAndQuotaModel;

  factory LeaveTakenAndQuotaModel.fromJson(Map<String, Object?> json) =>
      _$LeaveTakenAndQuotaModelFromJson(json);
}

