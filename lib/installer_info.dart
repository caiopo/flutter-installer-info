import 'dart:async';

import 'package:flutter/services.dart';

class InstallerInfo {
  static const MethodChannel _channel = const MethodChannel('installer_info');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
