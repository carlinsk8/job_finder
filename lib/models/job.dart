import 'dart:convert';

import 'package:job_finder_ui/models/company.dart';

List<Job> jobFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Job {
  Job(
      {this.role,
      this.location,
      this.themeDark,
      this.company,
      this.isFavorite});

  String role;
  String location;
  bool themeDark;
  Company company;
  bool isFavorite;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        role: json["role"],
        location: json["location"],
        themeDark: json["teme_dark"],
        isFavorite: json["favorite"],
        company: Company.fromJson(json["company"]),
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "location": location,
        "teme_dark": themeDark,
        "favorite": isFavorite,
        "company": company.toJson(),
      };
}
