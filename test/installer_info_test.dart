import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:installer_info/installer_info.dart';

void main() {
  const MethodChannel channel = MethodChannel('installer_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await InstallerInfo.platformVersion, '42');
  });
}
