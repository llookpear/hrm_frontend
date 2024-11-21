// class PaySlipDetailModel {
//   int payslip_id;
//   double amount;
//   String salary_detail;
//   int salary_type_id;
//
//   PaySlipDetailModel({
//     required this.payslip_id,
//     required this.amount,
//     required this.salary_detail,
//     required this.salary_type_id,
//   });
//
//   factory PaySlipDetailModel.fromJson(Map<String,dynamic> json) {
//     return PaySlipDetailModel(
//       payslip_id: json['payslip_id'] as int,
//       amount: (json['amount'] as num).toDouble(),
//       salary_detail: json['salary_detail'] as String,
//       salary_type_id: json['salary_type_id'] as int,
//     );
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'payslip_detail_model.freezed.dart';
part 'payslip_detail_model.g.dart';

@freezed
class PaySlipDetailModel with _$PaySlipDetailModel {
  PaySlipDetailModel._();

  factory PaySlipDetailModel({
    @JsonKey(name:'payslip_id') required int payslipID,
    required double amount,
    @Default('-') @JsonKey(name:'salary_detail') String salaryDetail,
    @JsonKey(name:'salary_type_id') required int salaryTypeID,

  }) = _PaySlipDetailModel;

  factory PaySlipDetailModel.fromJson(Map<String, Object?> json) =>
      _$PaySlipDetailModelFromJson(json);
}
