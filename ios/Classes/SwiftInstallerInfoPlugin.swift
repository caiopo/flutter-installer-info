import Flutter
import UIKit

public class SwiftInstallerInfoPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "com.caiopo.installer_info", binaryMessenger: registrar.messenger())
        let instance = SwiftInstallerInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getInstallerInfo" {
            if let path = Bundle.main.appStoreReceiptURL?.path {
                if path.contains("CoreSimulator") {
                    result("com.apple.CoreSimulator")
                } else if path.contains("sandboxReceipt") {
                    result("com.apple.TestFlight")
                } else {
                    result("com.apple.AppStore")
                }
            } else {
                result(nil)
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}
