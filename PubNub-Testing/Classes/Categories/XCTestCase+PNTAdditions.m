//
//  XCTestCase+PNTAdditions.m
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <PubNub/PubNub.h>
#import <BlocksKit/BlocksKit.h>
#import "XCTestCase+PNTAdditions.h"

@implementation XCTestCase (PNTAdditions)

- (BOOL)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult {
    XCTAssertNotNil(expectedResult);
    XCTAssertNotNil(actualResult);
    NSArray<NSString *> *keys = [expectedResult keysToAssert];
    __block NSMutableArray *expectedValues = [NSMutableArray array];
    __block NSMutableArray *actualValues = [NSMutableArray array];
    [keys bk_each:^(id obj) {
        NSString *key = (NSString *)obj;
        [expectedValues addObject:[expectedResult valueForKey:key]];
        [actualValues addObject:[actualResult valueForKey:key]];
    }];
    return [expectedValues.copy bk_corresponds:actualValues.copy withBlock:^BOOL(id obj1, id obj2) {
        XCTAssertEqualObjects(obj1, obj2);
        return [obj1 isEqual:obj2];
    }];
    
}

@end
