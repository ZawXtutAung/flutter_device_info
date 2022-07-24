import 'package:flutter/material.dart';
import 'package:flutter_device_id/screen/info.dart';
import 'package:flutter_device_id/screen/my_id.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Device Info')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyId();
                  }));
                },
                child: const Card(
                  color: Colors.cyan,
                  child: SizedBox(
                      height: 100,
                      child: Center(
                          child: Text(
                        'Device ID',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
                ),
              )),
              Expanded(
                  child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyInfo();
                  }));
                },
                child: const Card(
                  color: Colors.amber,
                  child: SizedBox(
                      height: 100,
                      child: Center(
                          child: Text(
                        'Device Info',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
                ),
              ))
            ],
          )
          // Expanded(child: Text(_id == null ? 'loading..' : _id!)),
          // ElevatedButton(onPressed: getInfo, child: Text('You`s Device ID'))
        ],
      ),
    );
  }
}
