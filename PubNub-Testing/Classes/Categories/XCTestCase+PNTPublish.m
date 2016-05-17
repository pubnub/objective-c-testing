//
//  XCTestCase+PNTPublish.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/22/16.
//
//

#import <PubNub/PubNub.h>
#import "PNTTestPublishStatus.h"
#import "XCTestCase+PNTPublish.h"
#import "XCTestCase+PNTAdditions.h"

@implementation XCTestCase (PNPublish)

- (PNPublishCompletionBlock)PNT_completionWithExpectedPublishStatus:(PNTTestPublishStatus *)expectedPublishStatus; {
    XCTAssertNotNil(expectedPublishStatus);
    __block XCTestExpectation *publishExpectation = [self expectationWithDescription:@"publish"];
    return ^void (PNPublishStatus *status) {
//        [expectedPublishStatus PNT_assertWithPubNubObject:status];
        [self PNT_assertExpected:expectedPublishStatus withActual:status];
        [publishExpectation fulfill];
    };
}

//- (void)PNT_assertOnPublishStatus:(PNPublishStatus *)status withSuccess:(BOOL)isSuccessful {
//    XCTAssertNotNil(status);
//    XCTAssertEqual(status.operation, PNPublishOperation);
//    if (isSuccessful) {
//        XCTAssertFalse(status.isError);
//        XCTAssertEqual(status.category, PNAcknowledgmentCategory);
//        XCTAssertEqual(status.statusCode, 200);
//        XCTAssertEqualObjects(status.data.information, @"Sent");
//    } else {
//        XCTAssertTrue(status.isError);
//        XCTAssertEqual(status.category, PNBadRequestCategory);
//        XCTAssertEqual(status.statusCode, 400);
//        XCTAssertNil(status.data.information);
//        XCTAssertNil(status.data.timetoken);
//    }
//}
//
//- (PNPublishCompletionBlock)PNT_successfulPublishCompletionWithExpectedTimeToken:(NSNumber *)timeToken {
//    __block XCTestExpectation *publishExpectation = [self expectationWithDescription:@"publish"];
//    return ^void (PNPublishStatus *status) {
//        [self PNT_assertOnPublishStatus:status withSuccess:YES];
//        XCTAssertEqualObjects(status.data.timetoken, timeToken);
//        [publishExpectation fulfill];
//    };
//}
//
//- (PNPublishCompletionBlock)PNT_failedPublishCompletion {
//    __block XCTestExpectation *publishExpectation = [self expectationWithDescription:@"publish"];
//    return ^void (PNPublishStatus *status) {
//        [self PNT_assertOnPublishStatus:status withSuccess:NO];
//        [publishExpectation fulfill];
//    };
//}

@end
