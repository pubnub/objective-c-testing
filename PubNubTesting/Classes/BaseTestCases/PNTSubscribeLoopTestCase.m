//
//  PNTSubscribeLoopTestCase.m
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import "PNTSubscribeLoopTestCase.h"
#import "PNTTestStatus.h"
#import "PNTTestResult.h"

@implementation PNTSubscribeLoopTestCase

- (void)setUp {
    [super setUp];
    if (self.shouldRunSubscribeSetUp) {
        [self.client addListener:self];
    }
}

- (void)tearDown {
    if (self.shouldRunSubscribeTearDown) {
        [self.client unsubscribeFromAll];
    }
    [super tearDown];
}

#pragma mark - Customization

- (BOOL)shouldRunSubscribeSetUp {
    return YES;
}

- (BOOL)shouldRunSubscribeTearDown {
    return YES;
}

- (NSDictionary<NSString *, NSNumber *> *)subscribedChannels {
    return @{
             
             };
}

- (NSDictionary<NSString *, NSNumber *> *)subscribedChannelGroups {
    return @{
             
             };
}

#pragma mark - PNObjectEventListener

- (void)client:(PubNub *)client didReceiveStatus:(PNStatus *)status {
    
}

- (void)client:(PubNub *)client didReceiveMessage:(nonnull PNMessageResult *)message {
    
}

- (void)client:(PubNub *)client didReceivePresenceEvent:(PNPresenceEventResult *)event {
    
}

@end
