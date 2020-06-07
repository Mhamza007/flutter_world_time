import 'package:flutter/material.dart';
import 'package:flutterworldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime _worldTime = WorldTime(
      location: 'Islamabad',
      flag: 'Pakistan.png',
      url: 'Asia/Karachi',
    );
    await _worldTime.getTime();
    print(_worldTime.time);

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': _worldTime.location,
      'flag': _worldTime.flag,
      'time': _worldTime.time,
      'isDayTime': _worldTime.isDayTime
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
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
