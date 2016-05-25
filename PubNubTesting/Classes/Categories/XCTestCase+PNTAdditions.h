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

- (void)PNT_assertExpected:(PNTTestResult *)expectedResult withActual:(PNResult *)actualResult;
- (void)PNT_printTestingObject:(id)object; // can be either an array or a dictionary, this prints it in a way that can easily be inserted into a test

@end
