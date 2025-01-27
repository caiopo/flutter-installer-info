import 'dart:async';

import 'package:flutter/services.dart';

const _channel = MethodChannel('com.caiopo.installer_info');

/// Returns information about the method used to install your app.
///
/// On Android API 29 and below, uses Context.getInstallerPackageName()
/// On Android API 30 and above, uses PackageManager.getInstallSourceInfo()
/// On iOS, parses Bundle.main.appStoreReceiptURL
Future<InstallerInfo?> getInstallerInfo() async {
  final installerName = await _channel.invokeMethod('getInstallerInfo');
  if (installerName == null) return null;

  final installer = _installerNames[installerName];
  return InstallerInfo(installerName, installer);
}

class InstallerInfo {
  /// The installer package name, as returned by the platform
  final String installerName;

  /// Enum value based on [installerName]
  ///
  /// On Android it may be null if the app is installed by
  /// - ADB
  /// - a lesser known App Store
  /// - a backup restore tool
  final Installer? installer;

  InstallerInfo(this.installerName, this.installer);
}

/// Common installers
enum Installer {
  // Android
  googlePlay,
  amazonAppstore,
  huaweiAppGallery,
  samsungGalaxyStore,
  ruStore,

  // iOS
  appStore,
  testFlight,
  simulator,
}

const _installerNames = {
  // Android
  'com.android.vending': Installer.googlePlay,
  'com.amazon.venezia': Installer.amazonAppstore,
  'com.huawei.appmarket': Installer.huaweiAppGallery,
  'com.sec.android.app.samsungapps': Installer.samsungGalaxyStore,
  'ru.vk.store': Installer.ruStore,

  // iOS
  'com.apple.AppStore': Installer.appStore,
  'com.apple.TestFlight': Installer.testFlight,
  'com.apple.CoreSimulator': Installer.simulator,
};
