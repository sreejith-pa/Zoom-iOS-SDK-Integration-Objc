//
//  ViewController.m
//  ZoomEmbedObjc
//
//  Created by Sreejith on 21/04/20.
//  Copyright © 2020 Sreejith. All rights reserved.
//

#import "ViewController.h"
#import "MobileRTC/MobileRTC.h"

#define kSDKUserName    @"Superman"

@interface ViewController () <MobileRTCMeetingServiceDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)JoinMeeting:(id)sender {
    
    [self joinMeeting:@"6584388420" :@"319148"];
}

- (void) joinMeeting: (NSString*) meetingNo : (NSString *)password {
    NSLog(@"meetingNO: %@", meetingNo);
    
    if(![meetingNo length]) {
        // If the meeting number is empty, return error.
        NSLog(@"Please enter a meeting number");
        return;
    } else {
        // If the meeting number is not empty.
        MobileRTCMeetingService *service = [[MobileRTC sharedRTC] getMeetingService];
        
        if (service) {
            service.delegate = self;
            // initialize a parameter dictionary to store parameters.
            NSDictionary *paramDict = @{
                kMeetingParam_Username: kSDKUserName,
                kMeetingParam_MeetingNumber:meetingNo,
                kMeetingParam_MeetingPassword:password
            };
            
            MobileRTCMeetError response = [service joinMeetingWithDictionary:paramDict];
            
            NSLog(@"onJoinMeeting, response: %d", response);
        } else {
            NSLog(@"Sorry, Meeting is not online");
        }
    }
}

@end
