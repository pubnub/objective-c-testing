//
//  PNTSubscribeLoopTestCase.m
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import "PNTStack.h"
#import "PNTSubscribeLoopTestCase.h"
#import "PNTTestStatus.h"
#import "PNTTestResult.h"

@interface PNTSubscribeLoopTestCase ()
@property (nonatomic, strong) dispatch_queue_t accessQueue;
//@property (nonatomic, strong, readwrite) PNTStack<PNTTestSubscribeStatus *> *expectedSubscribeStatuses;
//@property (nonatomic, strong, readwrite) PNTStack<PNTTestMessageResult *> *expectedMessages;
@end

@implementation PNTSubscribeLoopTestCase

- (void)setUp {
    [super setUp];
    self.accessQueue = dispatch_queue_create("com.PubNubTesting.subscribeLoopTestCaseAccessQueue", DISPATCH_QUEUE_CONCURRENT);
//    self.expectedSubscribeStatuses = [PNTStack stack];
//    self.expectedMessages = [PNTStack stack];
    if (self.shouldRunSubscribeSetUp) {
        [self.client addListener:self];
    }
}

- (void)tearDown {
    if (self.shouldRunSubscribeTearDown) {
        [self.client unsubscribeFromAll];
    }
//    self.expectedSubscribeStatuses = nil;
//    self.expectedMessages = nil;
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
