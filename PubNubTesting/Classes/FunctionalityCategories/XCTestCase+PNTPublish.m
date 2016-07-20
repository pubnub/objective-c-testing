//
//  XCTestCase+PNTPublish.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "XCTestCase+PNTPublish.h"
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestStatus.h"

@implementation XCTestCase (PNTPublish)

- (PNPublishCompletionBlock)PNT_completionWithExpectedPublishStatus:(PNTTestPublishStatus *)expectedPublishStatus; {
    XCTAssertNotNil(expectedPublishStatus);
    __block XCTestExpectation *publishExpectation = [self expectationWithDescription:@"publish"];
    return ^void (PNPublishStatus *status) {
        if (expectedPublishStatus) {
            expectedPublishStatus.actualErrorStatus = (PNErrorStatus *)status;
        }
        [self PNT_assertTestRepresentation:expectedPublishStatus];
        [publishExpectation fulfill];
    };
}

@end
