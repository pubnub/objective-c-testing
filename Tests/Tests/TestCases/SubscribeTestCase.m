//
//  SubscribeTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 7/15/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface SubscribeTestCase : PNTSubscribeLoopTestCase

@end

@implementation SubscribeTestCase

- (BOOL)isRecording {
    return NO;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (NSDictionary<NSString *, NSNumber *> *)subscribedChannels {
    return @{
             @"a": @(YES),
             };
}

- (NSArray<PNTTestSubscribeStatus *> *)setUpSubscribeStatuses {
    return @[
             [PNTTestSubscribeStatus successfulSubscribeStatusWithClient:self.client subscribedChannels:@[@"a", @"a-pnpres"] subscribedChannelGroups:nil timeToken:@14694818239631984],
             ];
}

- (NSArray<PNTTestStatus *> *)tearDownSubscribeStatuses {
    return @[
             [PNTTestStatus successfulUnsubscribeStatusWithClient:self.client],
             ];
}

- (void)testSimpleSetUpAndTearDownWithPresence {
    XCTAssertTrue([self.client.channels containsObject:@"a"]);
}

@end
