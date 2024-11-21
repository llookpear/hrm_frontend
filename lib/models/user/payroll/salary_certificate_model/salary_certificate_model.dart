// import 'package:googleapis/content/v2_1.dart';
//
// class CertificateModel {
//   int certificate_id;
//   String date_stamp;
//   String status;
//   String created_at;
//
//
//   CertificateModel({
//     required this.certificate_id,
//     required this.date_stamp,
//     required this.status,
//     required this.created_at,
//   });
//
//   factory CertificateModel.fromJson(Map<String,dynamic> json) {
//     return CertificateModel(
//       certificate_id : json['certificate_id'] as int,
//       date_stamp : json['date_stamp'] as String,
//       status : json['status'] as String,
//       created_at : json['created_at'] as String,
//
//     );
//   }
// }


import 'package:freezed_annotation/freezed_annotation.dart';
part 'salary_certificate_model.freezed.dart';
part 'salary_certificate_model.g.dart';

@freezed
class CertificateModel with _$CertificateModel {
  CertificateModel._();

  factory CertificateModel({
    @JsonKey(name:'certificate_id') required int certificateID,
    @JsonKey(name:'date_stamp') required String dateStamp,
    @JsonKey(name:'status_id') required int statusID,
    @JsonKey(name:'created_at') required String createdAt,

  }) = _CertificateModel;

  factory CertificateModel.fromJson(Map<String, Object?> json) =>
      _$CertificateModelFromJson(json);
}
