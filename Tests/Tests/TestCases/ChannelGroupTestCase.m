//
//  ChannelGroupTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface ChannelGroupTestCase : PNTClientTestCase
@property (nonatomic, copy, readonly) NSString *channelGroup;
@end

@implementation ChannelGroupTestCase

- (NSString *)channelGroup {
    return @"channel-group-test-case";
}

- (BOOL)isRecording {
    return NO;
}

- (void)setUp {
    [super setUp];
    [self PNT_removeChannelGroup:self.channelGroup forClient:self.client];
    NSString *testCaseName = [self PNT_testCaseName];
    if ([testCaseName containsString:@"Existing"]) {
        [self PNT_addChannels:@[@"a", @"b", @"e"] toGroup:self.channelGroup forClient:self.client];
    }
}

- (void)tearDown {
    [self PNT_removeChannelGroup:self.channelGroup forClient:self.client];
    [super tearDown];
}

- (void)testAddChannelToNewChannelGroup {
    [self PNT_addChannels:@[@"a"] toGroup:self.channelGroup forClient:self.client];
}

- (void)testAddMultipleChannelsToNewChannelGroup {
    [self PNT_addChannels:@[@"a", @"c"] toGroup:self.channelGroup forClient:self.client];
}

- (void)testChannelToExistingChannelGroup {
    [self PNT_addChannels:@[@"c"] toGroup:self.channelGroup forClient:self.client];
}

- (void)testAddMultipleChannelsToExistingChannelGroup {
    [self PNT_addChannels:@[@"c", @"d"] toGroup:self.channelGroup forClient:self.client];
}

- (void)testRemoveChannelFromExistingGroup {
    PNTTestAcknowledgmentStatus *removeChannelStatus = [PNTTestAcknowledgmentStatus successfulChannelGroupRemoveWithClient:self.client];
    [self.client removeChannels:@[@"a"] fromGroup:self.channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:removeChannelStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}

- (void)testRemoveMultipleChannelsFromExistingGroup {
    PNTTestAcknowledgmentStatus *removeChannelStatus = [PNTTestAcknowledgmentStatus successfulChannelGroupRemoveWithClient:self.client];
    [self.client removeChannels:@[@"a", @"b"] fromGroup:self.channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:removeChannelStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}

@end
