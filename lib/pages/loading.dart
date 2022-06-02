import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_clock/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

String time = 'loading';

class _MyAppState extends State<Loading> {
  void setupWolrdTime() async {
    WorldTime instance = WorldTime(
        location: 'Tehran', flag: 'Tehran.png', url: 'Asia/Tehran', time: time);
    await instance.getTime();
    setState(() {
      time = instance.time;
    });
    Navigator.pushReplacementNamed(context, '/Home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setupWolrdTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: const Center(
          child: SpinKitChasingDots(
            size: 50.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
