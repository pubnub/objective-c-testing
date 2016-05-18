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
#import "PNTTestErrorStatus.h"

@implementation XCTestCase (PNTAdditions)

- (void)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult {
    XCTAssertNotNil(expectedResult);
    XCTAssertNotNil(actualResult);
    NSArray<NSString *> *keys = [expectedResult keysToAssert];
    id idActual = (id)actualResult;
    id idExpected = (id)expectedResult;
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id expectedValue = [expectedResult valueForKey:obj];
        Class PubNubClass = [expectedResult.class PubNubClass];
        XCTAssertTrue([actualResult isKindOfClass:PubNubClass]);
        id actualValue = [idActual valueForKey:obj];
        XCTAssertEqualObjects(expectedValue, actualValue);
    }];
    if ([expectedResult isKindOfClass:[PNTTestErrorStatus class]]) {
        PNTTestErrorStatus *castedExpected = (PNTTestErrorStatus *)expectedResult;
        NSArray<NSString *> *dataKeyPaths = [castedExpected dataKeyPathsToAssert];
        [dataKeyPaths enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *expectedKeyPath = [obj stringByReplacingOccurrencesOfString:@"data." withString:@""];
            id expectedKeyPathValue = [idExpected valueForKeyPath:expectedKeyPath];
            id actualKeyPathValue = [idActual valueForKeyPath:obj];
            XCTAssertEqualObjects(expectedKeyPathValue, actualKeyPathValue);
        }];
    }
}

@end
