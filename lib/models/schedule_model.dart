import 'dart:convert';

import 'package:get/get_state_manager/get_state_manager.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.schedule,
  });

  List<Schedule> schedule;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    schedule: List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "schedule": List<dynamic>.from(schedule.map((x) => x.toJson())),
  };
}

class Schedule extends GetxController{
  Schedule({
    this.time,
    this.from,
    this.to,
    this.bus,
  });

  String time;
  String from;
  String to;
  String bus;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    time: json["time"],
    from: json["from"],
    to: json["to"],
    bus: json["bus"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "from": from,
    "to": to,
    "bus": bus,
  };
}