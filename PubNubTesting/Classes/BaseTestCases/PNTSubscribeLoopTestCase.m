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

@interface PNTSubscribeLoopTestCase ()
@property (nonatomic, strong) dispatch_queue_t accessQueue;
@property (nonatomic, strong, readwrite) PNTThreadSafeStack<PNTTestSubscribeStatus *> *expectedSubscribeStatuses;
@property (nonatomic, strong, readwrite) PNTThreadSafeStack<PNTTestMessageResult *> *expectedMessages;
@end

@implementation PNTSubscribeLoopTestCase

- (void)setUp {
    [super setUp];
    self.accessQueue = dispatch_queue_create("com.PubNubTesting.subscribeLoopTestCaseAccessQueue", DISPATCH_QUEUE_CONCURRENT);
    self.expectedSubscribeStatuses = [PNTThreadSafeStack stackWithAccessQueue:self.accessQueue];
    self.expectedMessages = [PNTThreadSafeStack stackWithAccessQueue:self.accessQueue];
    if (self.shouldRunSubscribeSetUp) {
        NSArray<PNTTestSubscribeStatus *> *setUpStatuses = [self setUpSubscribeStatuses];
        for (PNTTestSubscribeStatus *status in setUpStatuses) {
            [self.expectedSubscribeStatuses push:status];
        }
        [self.client addListener:self];
    }
}

- (void)tearDown {
    if (self.shouldFailIfExtraExpectedSubscribeStatusesBeforeTearDown) {
        XCTAssertEqual(self.expectedSubscribeStatuses.count, 0, @"There should be no leftover subscribe statuses before tearDown commences");
    }
    if (self.shouldRunSubscribeTearDown) {
        // TODO: check if there are statuses left before tear down
        NSArray<PNTTestSubscribeStatus *> *tearDownStatuses = [self tearDownSubscribeStatuses];
        for (PNTTestSubscribeStatus *status in tearDownStatuses) {
            [self.expectedSubscribeStatuses push:status];
        }
        [self.client unsubscribeFromAll];
    }
    self.expectedSubscribeStatuses = nil;
    self.expectedMessages = nil;
    [super tearDown];
}

#pragma mark - Customization

- (BOOL)shouldFailIfExtraExpectedSubscribeStatusesBeforeTearDown {
    return YES;
}

- (BOOL)shouldRunSubscribeSetUp {
    return YES;
}

- (BOOL)shouldRunSubscribeTearDown {
    return YES;
}

- (NSArray<PNTTestSubscribeStatus *> *)setUpSubscribeStatuses {
    return [NSArray array];
}

- (NSArray<PNTTestSubscribeStatus *> *)tearDownSubscribeStatuses {
    return [NSArray array];
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
