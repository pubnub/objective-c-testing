//
//  XCTestCase+PNTSizeOfMessage.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 4/27/16.
//
//

#import "XCTestCase+PNTSizeOfMessage.h"

static NSInteger const kPNTMessageSizeTolerance = 15;

@implementation XCTestCase (PNTSizeOfMessage)

- (PNMessageSizeCalculationCompletionBlock)PNT_messageSizeCompletionWithSize:(NSInteger)expectedSize {
    __block XCTestExpectation *sizeExpectation = [self expectationWithDescription:@"message size"];
    return ^void (NSInteger size) {
        XCTAssertEqualWithAccuracy(expectedSize, size, kPNTMessageSizeTolerance);
        [sizeExpectation fulfill];
    };
}

@end
