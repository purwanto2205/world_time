import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setupWorldTime() async {
      WorldTime instance = WorldTime(location: 'Berlin', flag: 'indonesia.png', url: 'Europe/Berlin');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'time': instance.time,
        'location': instance.location,
        'flag': instance.flag,
        'isDayTime': instance.isDayTime,
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
