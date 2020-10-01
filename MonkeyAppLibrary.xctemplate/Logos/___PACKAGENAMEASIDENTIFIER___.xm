// See http://iphonedevwiki.net/index.php/Logos

#import <UIKit/UIKit.h>

#import <FLEX/FLEXManager.h>
/// #import <CocoaLumberjack/CocoaLumberjack.h>


%hook AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    BOOL result = %orig;
    [[FLEXManager sharedManager] showExplorer];

    /// [DDLog addLogger:[DDOSLogger sharedInstance]]; // Uses os_log

    return result;
}
%end

%hook AFSecurityPolicy
- (NSUInteger)SSLPinningMode {
    return 0;
}
- (BOOL)allowInvalidCertificates {
    return YES;
}
- (BOOL)validatesDomainName {
    return NO;
}
%end