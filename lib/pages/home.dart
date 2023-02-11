import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Map data = {};
  // var data;
  Map<dynamic,dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    String? location = data["location"];
    String? time = data["time"];
    String? bgImage = (data["isDayTime"]?? false) ? "day.png" : "night.png";
    Color bgColor = ( data["isDayTime"]?? false) ? Colors.white : Colors.black;
    print(data);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgImage"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: SafeArea(
              child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, "/location");
                    setState(() {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "flag": result["flag"],
                        "isDayTime": result["isDayTime"]
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text("Edit Location")),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$location",
                    style: TextStyle(fontSize: 28.0, letterSpacing: 2),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "$time",
                style: TextStyle(fontSize: 66.0, color: bgColor),
              )
            ],
          )),
        ),
      ),
    );
  }
}
