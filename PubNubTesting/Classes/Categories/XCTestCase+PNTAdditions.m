//
//  XCTestCase+PNTAdditions.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <PubNub/PubNub.h>
#import <JSONLiteralString/JSONLiteralString.h>
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestConstants.h"
#import "PNTTestErrorStatus.h"

@implementation XCTestCase (PNTAdditions)

- (void)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult {
    if (
        !expectedResult &&
        !actualResult
        ) {
        // if both are nil then return, nothing to check
        return;
    }
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
        XCTAssertEqualObjects(expectedValue, actualValue, @"For key (%@) expected value (%@) does not match actual value (%@)", obj, expectedValue, actualValue);
    }];
    if ([expectedResult respondsToSelector:@selector(dataKeysToAssert)]) {
        NSArray<NSString *> *dataKeyPaths = [expectedResult dataKeysToAssert];
        [dataKeyPaths enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *expectedKeyPath = [obj stringByReplacingOccurrencesOfString:@"data." withString:@""];
            id expectedKeyPathValue = [idExpected valueForKeyPath:expectedKeyPath];
            id actualKeyPathValue = [idActual valueForKeyPath:obj];
            if ([expectedKeyPathValue isKindOfClass:[NSArray class]]) {
                NSArray *expectedArray = (NSArray *)expectedKeyPathValue;
                NSArray *actualArray = (NSArray *)actualKeyPathValue;
                XCTAssertEqual(expectedArray.count, actualArray.count);
                if (expectedArray.count != actualArray.count) {
                    // Stop execution if the count is different, above check is slightly inefficient but creates better logs
                    [self PNT_prettyPrint:actualArray];
                    return;
                }
                for (NSInteger i=0; i<expectedArray.count; i++) {
                    XCTAssertNotNil(expectedArray[i]);
                    id expectedArrayValue = expectedArray[i];
                    XCTAssertNotNil(actualArray[i]);
                    id actualArrayValue = actualArray[i];
                    XCTAssertEqualObjects(expectedArrayValue, actualArrayValue, @"Failure to match at index (%d) for expected value (%@) and actual value (%@)", i, expectedArrayValue, actualArrayValue);
                    if (![expectedArrayValue isEqual:actualArrayValue]) {
                        [self PNT_prettyPrint:actualArray];
                        return;
                    }
                }
            } else {
                XCTAssertEqualObjects(expectedKeyPathValue, actualKeyPathValue, @"For keyPath (%@) expected value (%@) does not match actual value (%@)", obj, expectedKeyPathValue, actualKeyPathValue);
            }
        }];
    }
}

- (void)PNT_prettyPrint:(id)object {
    NSLog(@"%p:\n%@", object, [object JLS_literalString]);
}

@end
