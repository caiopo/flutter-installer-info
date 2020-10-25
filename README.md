# installer_info

Returns information about the method used to install your app.

On Android, uses `context.getInstallerPackageName()``

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
