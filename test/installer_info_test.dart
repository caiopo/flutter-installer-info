import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:installer_info/installer_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.caiopo.installer_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'getInstallerInfo') {
        return 'com.android.vending';
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getInstallerInfo', () async {
    final installerInfo = await (getInstallerInfo() as FutureOr<InstallerInfo>);
    expect(installerInfo.installerName, 'com.android.vending');
    expect(installerInfo.installer, Installer.googlePlay);
  });
}
