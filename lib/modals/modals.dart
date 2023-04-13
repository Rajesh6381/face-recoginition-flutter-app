// To parse this JSON data, do
//
//     final attendanceModals = attendanceModalsFromJson(jsonString);


import 'dart:convert';

import 'attendance_modals.dart';


AttendanceModals attendanceModalsFromJson(String str) => AttendanceModals.fromJson(json.decode(str));

String attendanceModalsToJson(AttendanceModals data) => json.encode(data.toJson());

class AttendanceModals {
  AttendanceModals({
    required this.attendance,
    required this.classAndSection,
    required this.photo,
    required this.name,
    required this.date,
    required this.registerNumber,
  });

  List<Attendance> attendance;
  String classAndSection;
  String photo;
  String name;
  String date;
  int registerNumber;

  factory AttendanceModals.fromJson(Map<String, dynamic> json) => AttendanceModals(
    attendance: List<Attendance>.from(json["Attendance"].map((x) => Attendance.fromJson(x))),
    classAndSection: json["ClassAndSection"],
    photo: json["Photo"],
    name: json["Name"],
    date: json["Date"],
    registerNumber: json["RegisterNumber"],
  );

  Map<String, dynamic> toJson() => {
    "Attendance": List<dynamic>.from(attendance.map((x) => x.toJson())),
    "ClassAndSection": classAndSection,
    "Photo": photo,
    "Name": name,
    "Date": date,
    "RegisterNumber": registerNumber,
  };
}