import 'dart:convert';
import 'package:baiust_transport/models/schedule_model.dart';
import 'package:http/http.dart' as http;


class API_Manager {
  //var cartItems= List<Schedule>().obs;
  Future<Welcome> getSchedule() async {
    String news_url =
        'https://raw.githubusercontent.com/shakilhossain38/classmates_info/master/s.json';
    var client = http.Client();
    var newsModel;

    try {
      var response = await client.get(news_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        newsModel = Welcome.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }
    return newsModel;
  }
}
