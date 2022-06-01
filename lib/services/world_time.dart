import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WorldTime {
  String location;
  String time;
  String flag;
  String url;

  WorldTime(
      {required this.location,
      required this.flag,
      required this.url,
      required this.time});

  Future<void> getTime() async {
    try {
      http.Response response =
          await http.get(Uri.http('worldtimeapi.org', '/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dataTime = data['utc_datetime'];
      String offSetH = data['utc_offset'].substring(1, 3);
      String offSetM = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(dataTime);
      now = now.add(
        Duration(hours: int.parse(offSetH), minutes: int.parse(offSetM)),
      );
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('this is the error $e');
      time = 'not possible to get time';
    }
  }
}
