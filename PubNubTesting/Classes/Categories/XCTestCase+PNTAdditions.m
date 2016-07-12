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

@implementation XCTestCase (PNTAdditions)

- (void)PNT_assertTestRepresentation:(NSObject<PNTTestRepresentation> *)testObject; {
    if (
        !testObject
        ) {
        // if both are nil then return, nothing to check
        return;
    }
    NSObject *actualResult = [testObject actualResult];
    XCTAssertNotNil(actualResult);
    NSArray<NSString *> *keys = [testObject keysToAssert];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id expectedValue = [testObject valueForKey:obj];
        Class PubNubClass = [testObject.class PubNubClass];
        XCTAssertTrue([actualResult isKindOfClass:PubNubClass]);
        id actualValue = [actualResult valueForKey:obj];
        XCTAssertEqualObjects(expectedValue, actualValue, @"For key (%@) expected value (%@) does not match actual value (%@)", obj, expectedValue, actualValue);
    }];
    if (
        [testObject respondsToSelector:@selector(isError)] &&
        [testObject performSelector:@selector(isError)]
        ) {
        // add more checks for error messages later
    } else if ([testObject respondsToSelector:@selector(dataKeysToAssert)]) {
        NSArray<NSString *> *dataKeyPaths = [testObject dataKeysToAssert];
        [dataKeyPaths enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *expectedKeyPath = [obj stringByReplacingOccurrencesOfString:@"data." withString:@""];
            id expectedKeyPathValue = [testObject valueForKeyPath:expectedKeyPath];
            id actualKeyPathValue = [actualResult valueForKeyPath:obj];
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
                    XCTAssertEqualObjects(expectedArrayValue, actualArrayValue, @"Failure to match at index (%ld) for expected value (%@) and actual value (%@)", (long)i, expectedArrayValue, actualArrayValue);
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

- (NSString *)PNT_testCaseName {
    return NSStringFromSelector(self.invocation.selector);
}

- (void)PNT_waitFor:(NSTimeInterval)timeout {
    [self PNT_waitFor:timeout withHandler:nil];
}

- (void)PNT_waitFor:(NSTimeInterval)timeout withHandler:(XCWaitCompletionHandler)handler {
    NSParameterAssert(timeout);
    [self waitForExpectationsWithTimeout:timeout handler:^(NSError * _Nullable error) {
        XCTAssertNil(error);
        if (handler) {
            handler(error);
        }
    }];
}

@end
