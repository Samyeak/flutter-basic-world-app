import 'package:flutter/material.dart';
import 'package:flutter_world_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "Kathmandu", flag: "nepal.png", timezone: "Asia/Kathmandu")
    ,WorldTime(location: "Nairobi", flag: "nepal.png", timezone: "America/Nairobi")
    ,WorldTime(location: "Chicago", flag: "nepal.png", timezone: "America/Chicago")
  ];

  void updateTime(index) async {
    WorldTime worldTime = locations[index];
    await worldTime.getTime();

    Navigator.pop(context, {
      "location": worldTime.location,
      "time": worldTime.time,
      "flag": worldTime.flag,
      "isDayTime": worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder:(context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage("assets/night.png"),
              ),
            ),
          );
          }
      ),
    );
  }
}
