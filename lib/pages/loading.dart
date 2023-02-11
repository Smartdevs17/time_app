import 'package:flutter/material.dart';
import 'package:sample_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Lagos", flag: "germany.png", url: "Africa/Lagos");
    await instance.getTime();
    // print(instance.time);
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();

    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitThreeBounce(color: Colors.blue[600],size: 50.0,),
      )
    );
  }
}
