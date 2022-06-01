import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print('this is the build context.');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Location'),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              setState(() {
                counter += 1;
              });
            },
            child: Text('$counter click me')),
      ),
    );
  }
}
