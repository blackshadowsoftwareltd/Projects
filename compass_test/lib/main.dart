import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool _isPermissionGranted;
  CompassEvent? _lastEvent;
  DateTime? _lastTime;
  @override
  void initState() {
    super.initState();
    getPermissionStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Compass App')),
      body: _isPermissionGranted ? menuReader() : permissionSheet(),
    );
  }

  Widget menuReader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
            child: const Text('Read value'),
            onPressed: () async {
              final temp = await FlutterCompass.events!.first;
              _lastEvent = temp;
              _lastTime = DateTime.now();
            }),
        Column(
          children: [Text(_lastEvent.toString()), Text(_lastTime.toString())],
        )
      ],
    );
  }

  Widget permissionSheet() {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      TextButton(
          child: const Text('Location Permission Required'),
          onPressed: () {
            Permission.locationWhenInUse
                .request()
                .then((value) => getPermissionStatus());
          }),
      const SizedBox(height: 50),
      TextButton(
          child: const Text('Open App Settings'),
          onPressed: () {
            openAppSettings().then((value) {});
          })
    ]);
  }

  getPermissionStatus() {
    Permission.location.status.then((value) {
      if (mounted) {
        _isPermissionGranted = value == PermissionStatus.granted;
        setState(() {});
      }
    });
  }
}
