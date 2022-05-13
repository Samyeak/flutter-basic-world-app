import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(data);

    String bgImage = data["isDayTime"]  ? "day.png" : "night.png";
    Color bgColor = data["isDayTime"]  ? Colors.blue : Colors.blueAccent;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/${bgImage}"),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0,0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, "/location");
                    print("result: $result ");
                    setState(() {
                      data = result as Map<String,dynamic>;
                    });
                },
                  icon: Icon(Icons.edit_location, color: Colors.white,),
                  label: Text("Edit Location", style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data["time"],
                style: TextStyle(
                    fontSize: 66,
                    letterSpacing: 2.0
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
