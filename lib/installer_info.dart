import 'dart:async';

import 'package:flutter/services.dart';

const _channel = MethodChannel('com.caiopo.installer_info');

Future<InstallerInfo> getInstallerInfo() async {
  final installerName = await _channel.invokeMethod('getInstallerInfo');
  if (installerName == null) return null;

  final installer = _installerNames[installerName];
  return InstallerInfo(installerName, installer);
}

class InstallerInfo {
  final String installerName;
  final Installer installer;

  InstallerInfo(this.installerName, this.installer);
}

enum Installer {
  // Android
  googlePlay,
  huaweiAppGallery,
  amazonAppstore,

  // iOS
  appStore,
  testFlight,
  simulator,
}

const _installerNames = {
  'com.amazon.venezia': Installer.amazonAppstore,
  'com.android.vending': Installer.googlePlay,
  'com.apple.AppStore': Installer.appStore,
  'com.apple.TestFlight': Installer.testFlight,
  'com.apple.CoreSimulator': Installer.simulator,
};
