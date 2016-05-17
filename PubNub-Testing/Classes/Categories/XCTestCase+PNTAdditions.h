//
//  XCTestCase+PNTAdditions.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <XCTest/XCTest.h>
#import "PNTTestResult.h"

@interface XCTestCase (PNTAdditions)

- (void)PNT_assertExpected:(id<PNTTestRepresentation>)expectedResult withActual:(PNResult *)actualResult;

@end
