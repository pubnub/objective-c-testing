//
//  XCTestCase+PNTSizeOfMessage.m
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import "XCTestCase+PNTSizeOfMessage.h"

static NSInteger const kPNTMessageSizeTolerance = 20;

@implementation XCTestCase (PNTSizeOfMessage)

- (PNMessageSizeCalculationCompletionBlock)PNT_messageSizeCompletionWithSize:(NSInteger)expectedSize {
    __block XCTestExpectation *sizeExpectation = [self expectationWithDescription:@"message size"];
    return ^void (NSInteger size) {
        XCTAssertEqualWithAccuracy(expectedSize, size, kPNTMessageSizeTolerance);
        [sizeExpectation fulfill];
    };
}

@end
