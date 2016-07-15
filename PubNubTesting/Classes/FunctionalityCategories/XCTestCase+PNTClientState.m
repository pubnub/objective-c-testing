//
//  XCTestCase+PNTClientState.m
//  Pods
//
//  Created by Jordan Zucker on 7/15/16.
//
//

#import "XCTestCase+PNTClientState.h"
#import "XCTestCase+PNTAdditions.h"
#import "PNTTestStatus.h"

@implementation XCTestCase (PNTClientState)

- (PNSetStateCompletionBlock)PNT_setClientStateWithExpectedStatus:(PNTTestClientStateUpdateStatus *)expectedStatus {
    __block XCTestExpectation *setClientStateExpectation = [self expectationWithDescription:@"set client state expecation"];
    return ^void (PNClientStateUpdateStatus *status) {
        if (expectedStatus) {
            expectedStatus.actualClientStateUpdateStatus = status;
            [self PNT_assertTestRepresentation:expectedStatus];
        }
        [setClientStateExpectation fulfill];
    };
}

@end
