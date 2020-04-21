//
//  AppDelegate.h
//  ZoomEmbedObjc
//
//  Created by Sreejith on 21/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileRTC/MobileRTC.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, MobileRTCAuthDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

