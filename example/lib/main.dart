import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:installer_info/installer_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InstallerInfo installerInfo;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    InstallerInfo installerInfo;
    try {
      installerInfo = await getInstallerInfo();
    } on PlatformException {}

    if (!mounted) return;

    setState(() => this.installerInfo = installerInfo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
            'Running on: ${installerInfo.installer} - ${installerInfo.installerName}',
          ),
        ),
      ),
    );
  }
}
