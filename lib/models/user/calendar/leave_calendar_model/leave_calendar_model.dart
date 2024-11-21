class LeaveModel {
  final DateTime startDate;
  final DateTime endDate;
  final String startTime;
  final String endTime;
  final String type;

  LeaveModel({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.type,
  });

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      startTime: json['start_time'],
      endTime: json['end_time'],
      type: json['type'],
    );
  }
}