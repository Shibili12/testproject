class TravelLogModel {
  final String log;
  final String logId;
  final String phone;
  final String battery;
  final String startTime;
  final String endTime;

  TravelLogModel({
    required this.log,
    required this.logId,
    required this.phone,
    required this.battery,
    required this.startTime,
    required this.endTime,
  });

  factory TravelLogModel.fromMap(Map<String, dynamic> json) {
    return TravelLogModel(
      log: json['logName'] ?? "",
      logId: json['logId'] ?? "",
      phone: json['phone'] ?? "",
      battery: json['battery'] ?? "",
      startTime: json['startTime'] ?? "",
      endTime: json['endTime'] ?? "",
    );
  }
}
