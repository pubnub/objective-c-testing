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
        [self PNT_assertExpected:expectedPublishStatus withActual:status];
        [publishExpectation fulfill];
    };
}

@end
