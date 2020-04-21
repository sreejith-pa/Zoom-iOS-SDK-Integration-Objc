//
//  AppDelegate.m
//  ZoomEmbedObjc
//
//  Created by Sreejith on 21/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

#define kSDKAppKey      @""
#define kSDKAppSecret   @""
#define kSDKDomain      @"zoom.us"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *myViewController = [storyboard instantiateViewControllerWithIdentifier:@"MyViewControllerIdentifier"];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:myViewController];
    navVC.navigationBarHidden = YES;
    
    self.window.rootViewController = navVC;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Step 1: Set SDK Domain and Enable log (You may disable the log feature in release version).
    MobileRTCSDKInitContext *context = [[MobileRTCSDKInitContext alloc] init];
    context.domain = kSDKDomain;
    context.enableLog = YES;
    
    //Note: This step is optional, Method is uesd for iOS Replaykit Screen share integration,if not,just ignore this step.
    BOOL initializeSuc = [[MobileRTC sharedRTC] initialize:context];
    
    // Step 2: Get Auth Service
    MobileRTCAuthService *authService = [[MobileRTC sharedRTC] getAuthService];
    
    NSLog(@"MobileRTC Version: %@", [[MobileRTC sharedRTC] mobileRTCVersion]);
    
    if (authService) {
        // Step 3: Setup Auth Service
        authService.delegate        = self;
        
        authService.clientKey       = kSDKAppKey;
        authService.clientSecret    = kSDKAppSecret;
        // Step 4: Call authentication function to initialize SDK
        [authService sdkAuth];
    }
    
    return YES;
}

- (void)onMobileRTCAuthReturn:(MobileRTCAuthError)returnValue {
    NSLog(@"onMobileRTCAuthReturn %d", returnValue);
    
    if (returnValue != MobileRTCAuthError_Success)
    {
        NSString *message = [NSString stringWithFormat:NSLocalizedString(@"SDK authentication failed, error code: %zd", @""), returnValue];
        NSLog(@"%@", message);
    } else {
        NSLog(@"onMobileRTCAuth Success");
    }
}


@end
