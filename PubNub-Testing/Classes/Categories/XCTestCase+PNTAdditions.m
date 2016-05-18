//
//  XCTestCase+PNTAdditions.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <PubNub/PubNub.h>
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestConstants.h"

@implementation XCTestCase (PNTAdditions)

- (void)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult {
    XCTAssertNotNil(expectedResult);
    XCTAssertNotNil(actualResult);
    NSArray<NSString *> *keys = [expectedResult keysToAssert];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id expectedValue = [expectedResult valueForKey:obj];
        Class PubNubClass = [expectedResult.class PubNubClass];
        XCTAssertTrue([actualResult isKindOfClass:PubNubClass]);
        id castedResult = (id)actualResult;
//        PubNubClassName *castedActualResult = objc_dynamic_cast(actualResult, PubNubClassName);
//        PubNubClassName castedActualValue = (PubNubClassName )actualResult;
        id actualValue = [actualResult valueForKey:obj];
        XCTAssertEqualObjects(expectedValue, actualValue);
    }];
}

@end
