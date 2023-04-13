// To parse this JSON data, do
//
//     final attendanceModals = attendanceModalsFromJson(jsonString);




class Attendance {
  Attendance({
    required this.attendanceStatus,
    required this.date,
  });

  String attendanceStatus;
  String date;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
    attendanceStatus: json["AttendanceStatus"],
    date: json["Date"],
  );

  Map<String, dynamic> toJson() => {
    "AttendanceStatus": attendanceStatus,
    "Date": date,
  };
}
