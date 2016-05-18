//
//  XCTestCase+PNTClientState.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 5/5/16.
//
//

#import "XCTestCase+PNTClientState.h"

@implementation XCTestCase (PNTClientState)

- (PNSetStateCompletionBlock)PNT_successfulSetClientState:(NSDictionary *)state {
    __block XCTestExpectation *setClientStateExpectation = [self expectationWithDescription:@"set client state expecation"];
    return ^void (PNClientStateUpdateStatus *status) {
        XCTAssertNotNil(status);
        XCTAssertFalse(status.isError);
        XCTAssertEqual(status.operation, PNSetStateOperation);
        XCTAssertEqual(status.category, PNAcknowledgmentCategory);
        XCTAssertEqual(status.statusCode, 200);
        XCTAssertEqualObjects(status.data.state, state);
        [setClientStateExpectation fulfill];
    };
}

@end
