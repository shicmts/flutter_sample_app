import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 여긴 뭐할까
/// 디바이스 함수 호출
class HomeTabSub2 extends StatefulWidget {
  const HomeTabSub2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeTabSub2State();
}

class _HomeTabSub2State extends State<HomeTabSub2> {
  final List<int> colorCodes = <int>[900, 600, 500, 100];
  OS _os = OS.android;
  static const platform = MethodChannel('com.shicmts.flutter_sample_app');
  String _batteryLevel = 'Unknown battery level.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<void> _showToast() async {
    await platform.invokeMethod('showToast');
  }

  Widget osListView(List<String> entries) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _getBatteryLevel,
              child: const Text('NATIVE :: Get Battery Level'),
            ),
            Text(_batteryLevel),
            OutlinedButton(
                onPressed: _showToast,
                child: const Text("NATIVE :: Show Toast Message")),
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("스낵바는 이런거다 퇴근 H-3")));
                },
                child: const Text("FLUTTER :: Show SnackBar")),
            ListTile(
              title: const Text("Android"),
              leading: Radio(
                  value: OS.android,
                  groupValue: _os,
                  onChanged: (OS? value) {
                    setState(() {
                      _os = value!;
                    });
                  }),
            ),
            ListTile(
              title: const Text("iOS"),
              leading: Radio(
                  value: OS.ios,
                  groupValue: _os,
                  onChanged: (OS? value) {
                    setState(() {
                      _os = value!;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

enum OS { android, ios }
