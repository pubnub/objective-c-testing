//
//  XCTestCase+PNTHistory.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/13/16.
//
//

#import "XCTestCase+PNTHistory.h"
#import "XCTestCase+PNTAdditions.h"

@implementation XCTestCase (PNTHistory)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlockWithHistoryResult:(PNTTestHistoryResult *)expectedResult andError:(PNTTestErrorStatus *)expectedErrorStatus {
    __block XCTestExpectation *historyExpectation = [self expectationWithDescription:@"history"];
    return ^void (PNHistoryResult * _Nullable result, PNErrorStatus * _Nullable status) {
        XCTAssertNotNil(result);
        XCTAssertNotNil(result.data.messages);
        [self PNT_assertExpected:expectedResult withActual:result];
        [self PNT_assertExpected:expectedErrorStatus withActual:status];
        [historyExpectation fulfill];
    };
}

@end
