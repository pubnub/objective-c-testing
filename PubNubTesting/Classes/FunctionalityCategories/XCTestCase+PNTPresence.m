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

- (PNHereNowCompletionBlock)PNT_hereNowCompletionBlockWithExpectedHereNowResult:(PNTTestPresenceChannelHereNowResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *hereNowExpectation = [self expectationWithDescription:@"here now"];
    return ^void (PNPresenceChannelHereNowResult * _Nullable result, PNErrorStatus * _Nullable status) {
        if (expectedResult) {
            expectedResult.actualHereNowResult = expectedResult;
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
