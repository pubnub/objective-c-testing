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

- (void)PNT_assertExpected:(id<PNTTestRepresentation>)expectedResult withActual:(PNResult *)actualResult {
    XCTAssertNotNil(expectedResult);
    XCTAssertNotNil(actualResult);
    NSArray<NSString *> *keys = [self _keysForExpectedResult:expectedResult];
}

- (NSArray<NSString *> *)_keysForExpectedResult:(id<PNTTestRepresentation>)expectedResult {
    
}

@end
