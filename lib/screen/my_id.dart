import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';

class MyId extends StatefulWidget {
  MyId({Key? key}) : super(key: key);

  @override
  State<MyId> createState() => _MyIdState();
}

class _MyIdState extends State<MyId> {
  String? _id;
  void getInfo() async {
    String? result = await PlatformDeviceId.getDeviceId;
    setState(() {
      _id = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Id'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Text(
            _id ?? 'Load..',
            style: TextStyle(fontSize: 20, color: Colors.red.shade900),
          )),
          ElevatedButton(
              onPressed: getInfo, child: Center(child: Text('Check')))
        ],
      ),
    );
  }
}
