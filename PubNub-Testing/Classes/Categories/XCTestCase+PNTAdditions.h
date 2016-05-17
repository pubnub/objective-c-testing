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

- (BOOL)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult;

@end
