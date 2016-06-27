//
//  XCTestCase+PNTChannelGroup.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/4/16.
//
//

#import "XCTestCase+PNTChannelGroup.h"
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestAcknowledgmentStatus.h"
#import "PNTTestConstants.h"

@implementation XCTestCase (PNTChannelGroup)

- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupChangeCompletionBlockWithResult:(PNTTestAcknowledgmentStatus *)expectedStatus {
    XCTAssertNotNil(expectedStatus);
    NSDate *now = [NSDate date];
    NSString *channelGroupChangeExpectationName = [NSString stringWithFormat:@"channel group change %@", now];
    __block XCTestExpectation *channelGroupChangeExpectation = [self expectationWithDescription:channelGroupChangeExpectationName];
    return ^void (PNAcknowledgmentStatus *status) {
        XCTAssertNotNil(status);
        [self PNT_assertExpected:(PNTTestResult *)expectedStatus withActual:(PNResult *)status];
        [channelGroupChangeExpectation fulfill];
        channelGroupChangeExpectation = nil;
    };
}

- (void)PNT_removeChannelGroup:(NSString *)channelGroup forClient:(PubNub *)client {
    XCTAssertNotNil(client);
    XCTAssertNotNil(channelGroup);
    PNTTestAcknowledgmentStatus *removeGroupStatus = [PNTTestAcknowledgmentStatus channelGroupRemoveAllChannelsWithClient:client];
    [client removeChannelsFromGroup:channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:removeGroupStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}

- (void)PNT_addChannels:(NSArray<NSString *> *)channels toGroup:(NSString *)channelGroup forClient:(PubNub *)client {
    XCTAssertNotNil(client);
    XCTAssertNotNil(channelGroup);
    PNTTestAcknowledgmentStatus *addChannelsStatus = [PNTTestAcknowledgmentStatus channelGroupAddWithClient:client];
    [client addChannels:channels toGroup:channelGroup withCompletion:[self PNT_channelGroupChangeCompletionBlockWithResult:addChannelsStatus]];
    [self PNT_waitFor:kPNTChannelGroupChangeTimeout];
}

//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupAdd {
//    __block XCTestExpectation *channelGroupAddExpectation = [self expectationWithDescription:@"channel group add expectation"];
//    return ^void (PNAcknowledgmentStatus *status) {
//        XCTAssertNotNil(status);
//        XCTAssertFalse(status.isError);
//        XCTAssertEqual(status.operation, PNAddChannelsToGroupOperation);
//        XCTAssertEqual(status.category, PNAcknowledgmentCategory);
//        XCTAssertEqual(status.statusCode, 200);
//        [channelGroupAddExpectation fulfill];
//    };
//}
//
//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveSomeChannels {
//    __block XCTestExpectation *channelGroupRemoveSomeExpectation = [self expectationWithDescription:@"channel group remove some expectation"];
//    return ^void (PNAcknowledgmentStatus *status) {
//        XCTAssertNotNil(status);
//        XCTAssertFalse(status.isError);
//        XCTAssertEqual(status.operation, PNRemoveChannelsFromGroupOperation);
//        XCTAssertEqual(status.category, PNAcknowledgmentCategory);
//        XCTAssertEqual(status.statusCode, 200);
//        [channelGroupRemoveSomeExpectation fulfill];
//    };
//}
//
//- (PNGroupChannelsAuditCompletionBlock)PNT_channelGroupAudit  {
//    __block XCTestExpectation *channelGroupAuditExpectation = [self expectationWithDescription:@"channel group audit expectation"];
//    return ^void (PNChannelGroupChannelsResult *result, PNErrorStatus *status) {
//        XCTAssertNotNil(result);
//        XCTAssertEqual(result.statusCode, 200);
//        XCTAssertEqual(result.operation, PNChannelsForGroupOperation);
//        [channelGroupAuditExpectation fulfill];
//    };
//}
//
//- (PNChannelGroupChangeCompletionBlock)PNT_channelGroupRemoveAllChannels {
//    __block XCTestExpectation *channelGroupRemoveAllExpectation = [self expectationWithDescription:@"channel group remove all expectation"];
//    return ^void (PNAcknowledgmentStatus *status) {
//        XCTAssertNotNil(status);
//        XCTAssertFalse(status.isError);
//        XCTAssertEqual(status.operation, PNRemoveGroupOperation);
//        XCTAssertEqual(status.category, PNAcknowledgmentCategory);
//        XCTAssertEqual(status.statusCode, 200);
//        [channelGroupRemoveAllExpectation fulfill];
//    };
//}

@end
