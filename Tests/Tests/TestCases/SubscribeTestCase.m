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
    return YES;
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

- (void)testSetUp {
    XCTAssertTrue([self.client.channels containsObject:@"a"]);
}

@end
