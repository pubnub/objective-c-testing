//
//  XCTestCase+PNTHistory.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "XCTestCase+PNTAdditions.h"
#import "XCTestCase+PNTHistory.h"
#import "PNTTestResult.h"
#import "PNTTestStatus.h"

@implementation XCTestCase (PNTHistory)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlockWithExpectedHistoryResult:(PNTTestHistoryResult *)expectedResult andExpectedError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *historyExpectation = [self expectationWithDescription:@"history"];
    return ^void (PNHistoryResult * _Nullable result, PNErrorStatus * _Nullable status) {
        XCTAssertTrue(result || status, @"Must have a result or a status at the least");
        if (expectedResult) {
            expectedResult.actualHistoryResult = result;
            [self PNT_assertTestRepresentation:expectedResult];
        }
        if (expectedErrorStatus) {
            expectedErrorStatus.actualErrorStatus = status;
            [self PNT_assertTestRepresentation:expectedErrorStatus];
        }
        [historyExpectation fulfill];
    };
}

@end
