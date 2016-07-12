//
//  XCTestCase+PNTAdditions.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <XCTest/XCTest.h>
#import "PNTTestRepresentation.h"

@class PNResult;

@interface XCTestCase (PNTAdditions)

- (void)PNT_assertTestRepresentation:(NSObject<PNTTestRepresentation> *)testObject;

- (void)PNT_prettyPrint:(id)object;

- (NSString *)PNT_testCaseName;

- (void)PNT_waitFor:(NSTimeInterval)timeout;
- (void)PNT_waitFor:(NSTimeInterval)timeout withHandler:(XCWaitCompletionHandler)handler;

@end
