# installer_info

[![Pub Version](https://img.shields.io/pub/v/installer_info)](https://pub.dev/packages/installer_info/)

Returns information about the method used to install your app.

On Android API 29 and below, uses `Context.getInstallerPackageName()`

On Android API 30 and above, uses `PackageManager.getInstallSourceInfo()`

On iOS, parses `Bundle.main.appStoreReceiptURL`


Installing
----------

Add to your pubspec.yaml

```yaml
dependencies:
  installer_info: <version>
```


Example
-------
```dart
final installerInfo = await getInstallerInfo();

print(installerInfo.installerName);
// com.android.vending

print(installerInfo.installer);
// Installer.googlePlay
```
