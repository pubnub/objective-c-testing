//
//  XCTestCase+PNTPresence.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "XCTestCase+PNTPresence.h"
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestStatus.h"
#import "PNTTestResult.h"

@implementation XCTestCase (PNTPresence)

- (PNHereNowCompletionBlock)PNT_channelHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *hereNowExpectation = [self expectationWithDescription:@"channel here now"];
    return ^void (PNPresenceChannelHereNowResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (expectedResult) {
            expectedResult.actualChannelHereNowResult = result;
            [self PNT_assertTestRepresentation:expectedResult];
        }
        if (expectedErrorStatus) {
            expectedErrorStatus.actualErrorStatus = status;
            [self PNT_assertTestRepresentation:expectedErrorStatus];
        }
        [hereNowExpectation fulfill];
    };
}

- (PNGlobalHereNowCompletionBlock)PNT_globalHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceGlobalHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *hereNowExpectation = [self expectationWithDescription:@"global here now"];
    return ^void (PNPresenceGlobalHereNowResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (expectedResult) {
            expectedResult.actualGlobalHereNowResult = result;
            [self PNT_assertTestRepresentation:expectedResult];
        }
        if (expectedErrorStatus) {
            expectedErrorStatus.actualErrorStatus = status;
            [self PNT_assertTestRepresentation:expectedErrorStatus];
        }
        [hereNowExpectation fulfill];
    };
}

- (PNChannelGroupHereNowCompletionBlock)PNT_channelGroupHereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelGroupHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *hereNowExpectation = [self expectationWithDescription:@"channel group here now"];
    return ^void (PNPresenceChannelGroupHereNowResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (expectedResult) {
            expectedResult.actualChannelGroupHereNowResult = result;
            [self PNT_assertTestRepresentation:expectedResult];
        }
        if (expectedErrorStatus) {
            expectedErrorStatus.actualErrorStatus = status;
            [self PNT_assertTestRepresentation:expectedErrorStatus];
        }
        [hereNowExpectation fulfill];
    };
}

- (PNWhereNowCompletionBlock)PNT_whereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceWhereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *hereNowExpectation = [self expectationWithDescription:@"where now"];
    return ^void (PNPresenceWhereNowResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (expectedResult) {
            expectedResult.actualWhereNowResult = result;
            [self PNT_assertTestRepresentation:expectedResult];
        }
        if (expectedErrorStatus) {
            expectedErrorStatus.actualErrorStatus = status;
            [self PNT_assertTestRepresentation:expectedErrorStatus];
        }
        [hereNowExpectation fulfill];
    };
}

@end
