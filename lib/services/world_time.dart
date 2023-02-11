import "package:http/http.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location; // location for the UI
  String? time; // time based on the locaion
  String? flag; //flag icon from the asset
  String? url; //url from the endpoint
  bool? isDayTime; // true or false if day or night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      //make a request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      // print(response.body);
      Map data = jsonDecode(response.body);
      // print(data);

      //get properties
      String datatime = data["datetime"];
      String offset = data["utc_offset"];
      String hr = offset.substring(1, 3);
      // print(datatime);
      // print(offset);

      //create time object
      DateTime now = DateTime.parse(datatime);
      now = now.add(Duration(hours: int.parse(hr)));
      // print(now);

      //set time to string
      // time = now.toString();

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      // format date
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught user error $e");
      time = "could not get the time data";
    }
  }
}

// WorldTime instance =
//     WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
