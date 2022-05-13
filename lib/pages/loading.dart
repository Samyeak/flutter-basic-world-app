import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_app/services/world_time.dart';
import 'package:http/http.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading";
  void setupWorldTime() async {
    WorldTime worldTime = WorldTime(location: "Kathmandu", flag: "nepal.png", timezone: "Asia/Kathmandu");
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": worldTime.location,
      "time": worldTime.time,
      "flag": worldTime.flag,
      "isDayTime": worldTime.isDayTime,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      body: Padding(
        padding: EdgeInsets.all(40),
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
