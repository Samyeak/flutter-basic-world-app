import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String flag;
  String timezone;
  bool isDayTime = true;

  WorldTime({required this.location, required this.flag, required this.timezone});

  Future<void> getTime() async {
    try{
      var url = Uri.parse("http://worldtimeapi.org/api/timezone/$timezone");
      Response response = await get(url);
      Map data = jsonDecode(response.body);
      print("Time Response: $data");
      //  Get properties from data
      String dateTimeString = data["datetime"];
      String offset = data["utc_offset"].substring(1,3);

      DateTime now = DateTime.parse(dateTimeString);
      now = now.add(Duration(hours: int.parse(offset)));
      time = DateFormat.jm().format(now);
      isDayTime = now.hour > 6 && now.hour < 20;
    }
    catch(e){
      print("Error fetching time data: $e");
      time = "Error fetching time data";
    }
  }
}