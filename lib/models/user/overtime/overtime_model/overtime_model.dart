class OvertimeModel {
  double total;

  OvertimeModel({required this.total});
  factory OvertimeModel.fromJson(Map<String, dynamic> json) {
    return OvertimeModel(
      total: json['total'] != null ? double.tryParse(json['total'].toString()) ?? 0.0 : 0.0,
    );
  }

}


