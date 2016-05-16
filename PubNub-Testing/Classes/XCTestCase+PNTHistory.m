//
//  XCTestCase+PNTHistory.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/13/16.
//
//

#import "XCTestCase+PNTHistory.h"

@implementation XCTestCase (PNTHistory)

- (PNHistoryCompletionBlock)PNT_historyCompletionBlock {
    __block XCTestExpectation *historyExpectation = [self expectationWithDescription:@"history"];
    return ^void (PNHistoryResult * _Nullable result, PNErrorStatus * _Nullable status) {
        NSLog(@"result: %@", result.debugDescription);
        XCTAssertNotNil(result);
        XCTAssertNotNil(result.data.messages);
        XCTAssertGreaterThan(result.data.messages.count, 0);
        XCTAssertLessThanOrEqual(result.data.messages.count, 100);
        [historyExpectation fulfill];
    };
}

@end
