class LeaveTypeModel {
  int msleave_id;
  String type;

  LeaveTypeModel({
    required this.msleave_id,
    required this.type,
  });

  factory LeaveTypeModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'msleave_id': int msleave_id, 'type': String type} =>
        LeaveTypeModel(msleave_id: msleave_id, type: type),
      _ => throw const FormatException('Failed to load'),
    };
  }
}
