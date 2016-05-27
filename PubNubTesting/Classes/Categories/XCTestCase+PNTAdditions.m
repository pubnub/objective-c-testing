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
        XCTAssertEqualObjects(expectedValue, actualValue);
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
                for (NSInteger i=0; i<expectedArray.count; i++) {
                    XCTAssertNotNil(expectedArray[i]);
                    id expectedArrayValue = expectedArray[i];
                    XCTAssertNotNil(actualArray[i]);
                    id actualArrayValue = actualArray[i];
                    XCTAssertEqualObjects(expectedArrayValue, actualArrayValue, @"Failure to match at index (%d) for expected value (%@) and actual value (%@)", i, expectedArrayValue, actualArrayValue);
                }
            } else {
                XCTAssertEqualObjects(expectedKeyPathValue, actualKeyPathValue);
            }
        }];
    }
}

- (NSString *)PNT_stringByAppendingPrettyPrintedStringForObject:(id)object toString:(NSString *)existingString {
    if (
        !object ||
        !existingString
        ) {
        return nil;
    }
    if ([object isKindOfClass:[NSArray class]]) {
        NSArray *arrayObject = (NSArray *)object;
        existingString = [existingString stringByAppendingString:@"@[\n"];
        for (id item in arrayObject) {
            return [self PNT_stringByAppendingPrettyPrintedStringForObject:item toString:existingString];
        }
        
    }
//    NSString *prettyPrintString = @"";
//    if ([object isKindOfClass:[NSArray class]]) {
//        NSArray *arrayObject = (NSArray *)object;
//        prettyPrintString = [prettyPrintString stringByAppendingString:@"@[\n"];
//        for (id item in arrayObject) {
//            NSString *itemString = nil;
//            if ([item isKindOfClass:[NSNumber class]]) {
//                itemString = [NSString stringWithFormat:@"\t\@%@,\n", item];
//            } else if ([item isKindOfClass:[NSString class]]) {
//                itemString = [NSString stringWithFormat:@"\t\@\"%@\",\n", item];
//            }
//            if (itemString) {
//                prettyPrintString = [prettyPrintString stringByAppendingString:itemString];
//            }
//            
//        }
//        prettyPrintString = [prettyPrintString stringByAppendingString:@"];"];
//    }
//    return prettyPrintString;
}

- (void)PNT_printTestingObject:(id)object {
    NSString *prettyPrintString = [self PNT_stringByAppendingPrettyPrintedStringForObject:object toString:@""];
    if (prettyPrintString) {
        NSLog(@"%@", prettyPrintString);
    }
}

- (NSString *)PNT_prettyPrintedLine:(id)object {
    if (!object) {
        return nil;
    }
    return [NSString stringWithFormat:@"\t\@%@,\n", object];
}

@end
