#import "InstallerInfoPlugin.h"
#if __has_include(<installer_info/installer_info-Swift.h>)
#import <installer_info/installer_info-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "installer_info-Swift.h"
#endif

@implementation InstallerInfoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftInstallerInfoPlugin registerWithRegistrar:registrar];
}
@end
