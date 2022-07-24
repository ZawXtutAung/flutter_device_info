import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  MyInfo({Key? key}) : super(key: key);

  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {
  Map? _info;
  void _getInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final result = await deviceInfoPlugin.deviceInfo;
    setState(() {
      _info = result.toMap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Device Info'),
        ),
        body: Column(
          children: [
            _info != null
                ? Expanded(
                    child: ListView(
                        padding: const EdgeInsets.all(5),
                        children: _info!.entries
                            .map((e) => Wrap(
                                  children: [
                                    Card(
                                        child: Container(
                                      padding: const EdgeInsets.all(5),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${e.key} ",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            e.value.toString(),
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                ))
                            .toList()),
                  )
                : const Expanded(
                    child: Center(
                      child: Text('Check Botton'),
                    ),
                  ),
            ElevatedButton(
                onPressed: _getInfo,
                child: const Center(child: Text('Show info')))
          ],
        ));
  }
}
