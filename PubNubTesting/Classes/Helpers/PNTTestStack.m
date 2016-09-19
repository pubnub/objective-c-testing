//
//  PNTTestStack.m
//  Pods
//
//  Created by Jordan Zucker on 7/22/16.
//
//

#import <XCTest/XCTest.h>
#import "PNTTestStack.h"
#import "PNTTestConstants.h"

@interface PNTTestStack ()
@property (nonatomic, strong, readwrite) dispatch_queue_t accessQueue;
@end

@implementation PNTTestStack

- (instancetype)initStackWithAccessQueue:(dispatch_queue_t)dispatchQueue {
    NSParameterAssert(dispatchQueue);
    self = [super init];
    if (self) {
        _accessQueue = dispatchQueue;
    }
    return self;
}

+ (instancetype)stackWithAccessQueue:(dispatch_queue_t)dispatchQueue {
    return [[self alloc] initStackWithAccessQueue:dispatchQueue];
}

- (void)push:(id)expectedResult withExpectation:(XCTestExpectation *)expectation {
    __block XCTestExpectation *originalExpectation = expectation;
    PNTWeakify(self);
    dispatch_barrier_async(self.accessQueue, ^{
        PNTStrongify(self);
        [self push:expectedResult];
        if (originalExpectation) {
            [originalExpectation fulfill];
        }
    });
}

- (void)pushFromArray:(NSArray *)array withExpectation:(XCTestExpectation *)expectation {
    if (!array.count) {
        [expectation fulfill];
        return;
    }
    PNTWeakify(self);
    dispatch_queue_t pushQueue = dispatch_queue_create("com.PNTTestStack.pushQueue", DISPATCH_QUEUE_CONCURRENT);
    // dispatch apply is synchronous, so fulfill after
    dispatch_apply(array.count, pushQueue, ^(size_t iteration) {
        PNTStrongify(self);
        id expectedResult = array[iteration];
        [self push:expectedResult];
    });
    if (expectation) {
        [expectation fulfill];
    }
}

- (nullable id)popWithExpectation:(XCTestExpectation *)expectation {
    __block id result = nil;
    __block XCTestExpectation *originalExpectation = expectation;
    PNTWeakify(self);
    dispatch_sync(self.accessQueue, ^{
        PNTStrongify(self);
        result = [self pop];
        if (originalExpectation) {
            [originalExpectation fulfill];
        }
    });
    return result;
}

- (BOOL)isEmptyWithExpectation:(XCTestExpectation *)expectation {
    return ([self countWithExpectation:expectation] ? NO : YES);
}

- (NSUInteger)countWithExpectation:(XCTestExpectation *)expectation {
    __block NSUInteger size = YES;
    __block XCTestExpectation *originalExpectation = expectation;
    PNTWeakify(self);
    dispatch_sync(self.accessQueue, ^{
        PNTStrongify(self);
        size = [super count];
        if (originalExpectation) {
            [originalExpectation fulfill];
        }
    });
    return size;
}

@end
