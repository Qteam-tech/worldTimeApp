import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:country_icons/country_icons.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> Locations = [
    WorldTime(
        url: 'Asia/Tehran',
        location: 'Tehran',
        flag: 'ir',
        time: 'time',
        isDayTime: true),
    WorldTime(
        url: 'Europe/Berlin',
        location: 'Berlin',
        flag: 'gr',
        time: 'time',
        isDayTime: true),
    WorldTime(
        url: 'Europe/Istanbul',
        location: 'Istanbul',
        flag: 'et',
        time: 'time',
        isDayTime: true),
    WorldTime(
        url: 'Asia/Dubai',
        location: 'Dubai',
        flag: 'ae',
        time: 'time',
        isDayTime: true),
    WorldTime(
        url: 'Asia/Tokyo',
        location: 'Tokyo',
        flag: 'jp',
        time: 'time',
        isDayTime: true),
  ];

  void updateTime(index) async {
    WorldTime instance = Locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: Locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(Locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      'icons/flags/png/${Locations[index].flag}.png',
                      package: 'country_icons'),
                ),
              ),
            );
          }),
    );
  }
}
