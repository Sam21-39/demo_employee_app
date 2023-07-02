// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);

import 'dart:convert';

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));

String employeeToJson(Employee data) => json.encode(data.toJson());

class Employee {
  int? eid;
  String? name;
  String? role;
  String? startDate;
  String? endDate;

  Employee({
    this.eid,
    this.name,
    this.role,
    this.startDate,
    this.endDate,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        eid: json['id'],
        name: json["name"],
        role: json["role"],
        startDate: json["start_date"],
        endDate: json["end_date"],
      );

  Map<String, dynamic> toJson() => {
        'id': eid,
        "name": name,
        "role": role,
        "start_date": startDate,
        "end_date": endDate,
      };
}
