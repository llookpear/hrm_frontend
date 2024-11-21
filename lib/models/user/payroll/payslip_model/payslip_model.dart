//
// class PayRollModel {
//   String payslip_id;
//   DateTime date;
//
//   PayRollModel({required this.payslip_id, required this.date});
//   factory PayRollModel.fromJson(Map<String, dynamic> json) {
//     if (json.containsKey('payslip_id') && json.containsKey('date')) {
//       return PayRollModel(
//         payslip_id: json['payslip_id'].toString(),
//         date: DateTime.parse(json['date']),
//       );
//     } else {
//       throw  FormatException('Invalid JSON format');
//     }
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'payslip_model.freezed.dart';
part 'payslip_model.g.dart';

@freezed
class PaySlipModel with _$PaySlipModel {
  PaySlipModel._();

  factory PaySlipModel({
    @JsonKey(name:'payslip_id') required int payslipID,
    required DateTime date,

  }) = _PaySlipModell;

  factory PaySlipModel.fromJson(Map<String, Object?> json) =>
      _$PaySlipModelFromJson(json);
}
