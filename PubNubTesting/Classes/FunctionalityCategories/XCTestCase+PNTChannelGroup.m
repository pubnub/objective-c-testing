//
//  XCTestCase+PNTChannelGroup.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "XCTestCase+PNTChannelGroup.h"
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestStatus.h"
#import "PNTTestConstants.h"

@implementation XCTestCase (PNTChannelGroup)

- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupChangeCompletionBlockWithResult:(PNTTestAcknowledgmentStatus *)expectedStatus {
    XCTAssertNotNil(expectedStatus);
    NSDate *now = [NSDate date];
    NSString *channelGroupChangeExpectationName = [NSString stringWithFormat:@"channel group change %@", now];
    __block XCTestExpectation *channelGroupChangeExpectation = [self expectationWithDescription:channelGroupChangeExpectationName];
    return ^void (PNAcknowledgmentStatus *status) {
        XCTAssertNotNil(status);
        if (expectedStatus) {
            expectedStatus.actualErrorStatus = (PNErrorStatus *)status;
        }
        [self PNT_assertTestRepresentation:expectedStatus];
        [channelGroupChangeExpectation fulfill];
        channelGroupChangeExpectation = nil;
    };
}

- (void)PNT_removeChannelGroup:(NSString *)channelGroup forClient:(PubNub *)client {
    XCTAssertNotNil(client);
    XCTAssertNotNil(channelGroup);
    PNTTestAcknowledgmentStatus *removeGroupStatus = [PNTTestAcknowledgmentStatus successfulChannelGroupRemoveAllChannelsWithClient:client];
    [client removeChannelsFromGroup:channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:removeGroupStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}

- (void)PNT_addChannels:(NSArray<NSString *> *)channels toGroup:(NSString *)channelGroup forClient:(PubNub *)client {
    XCTAssertNotNil(client);
    XCTAssertNotNil(channelGroup);
    PNTTestAcknowledgmentStatus *addChannelsStatus = [PNTTestAcknowledgmentStatus successfulChannelGroupAddWithClient:client];
    [client addChannels:channels toGroup:channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:addChannelsStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}


@end
