//
//  PNTTestStack.h
//  Pods
//
//  Created by Jordan Zucker on 7/22/16.
//
//

#import "PNTStack.h"

@class XCTestExpectation;

NS_ASSUME_NONNULL_BEGIN

@interface PNTTestStack<ObjectType> : PNTStack<ObjectType>

@property (nonatomic, strong, readonly) dispatch_queue_t accessQueue;

- (instancetype)initStackWithAccessQueue:(dispatch_queue_t)dispatchQueue;
+ (instancetype)stackWithAccessQueue:(dispatch_queue_t)dispatchQueue;

- (void)pushFromArray:(NSArray<ObjectType> *)array withExpectation:(nullable XCTestExpectation *)expectation;
- (void)push:(ObjectType)expectedResult withExpectation:(nullable XCTestExpectation *)expectation;
- (nullable ObjectType)popWithExpectation:(nullable XCTestExpectation *)expectation;

- (BOOL)isEmptyWithExpectation:(nullable XCTestExpectation *)expectation;
- (NSUInteger)countWithExpectation:(nullable XCTestExpectation *)expectation;

@end

NS_ASSUME_NONNULL_END
