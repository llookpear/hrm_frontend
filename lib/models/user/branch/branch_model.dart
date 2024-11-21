import 'package:freezed_annotation/freezed_annotation.dart';

part 'branch_model.freezed.dart';

part 'branch_model.g.dart';

@freezed
class BranchModel with _$BranchModel {
  const factory BranchModel({
    @JsonKey(name: 'branch_id') required int branchID,
    @JsonKey(name: 'branch_name') required String branchName,
    @JsonKey(name: 'latitude') required double lat,
    @JsonKey(name: 'longitude') required double lng,
    @Default('-') String identifier,
    @Default('-') String uuid,
    required String address,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    required String email,
    @JsonKey(name: 'tax_id') required String taxID,
    ///default
    @Default(5) double locationDistance,
  }) = _BranchModel;

  factory BranchModel.fromJson(Map<String, Object?> json) =>
      _$BranchModelFromJson(json);
}
