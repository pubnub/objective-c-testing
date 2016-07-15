//
//  ChannelGroupTestCase.m
//  Tests
//
//  Created by Jordan Zucker on 5/18/16.
//  Copyright © 2016 Jordan Zucker. All rights reserved.
//

#import <PubNubTesting/PubNubTesting.h>

@interface ChannelGroupTestCase : PNTClientChannelGroupTestCase
@property (nonatomic, copy, readonly) NSString *channelGroup;
@end

@implementation ChannelGroupTestCase

- (NSString *)channelGroup {
    return @"channel-group-test-case";
}

- (BOOL)isRecording {
    return NO;
}

- (BOOL)shouldRunChannelGroupSetUp {
    NSString *testCaseName = [self PNT_testCaseName];
    if ([testCaseName containsString:@"Existing"]) {
        return YES;
    }
    return NO;
}

- (NSDictionary<NSString *, NSArray<NSString *> *> *)channelGroups {
    NSMutableDictionary<NSString *, NSArray<NSString *> *> *groups = [@{
                                                                        self.channelGroup: @[]
                                                                        } mutableCopy];
    NSString *testCaseName = [self PNT_testCaseName];
    if ([testCaseName containsString:@"Existing"]) {
        groups[self.channelGroup] = @[
                                      @"a",
                                      @"b",
                                      @"e",
                                      ];
    }
    return groups.copy;
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
