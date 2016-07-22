//
//  PNTStack.m
//  Pods
//
//  Created by Jordan Zucker on 7/19/16.
//
//

#import "PNTStack.h"
#import "PNTTestConstants.h"

@interface PNTStack ()
@property (nonatomic, strong) NSMutableArray *itemsArray;

@end

@implementation PNTStack

- (instancetype)init {
    self = [super init];
    if (self) {
        _itemsArray = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)stack {
    return [[self alloc] init];
}

- (void)push:(id)expectedResult {
    NSParameterAssert(expectedResult);
    [self.itemsArray insertObject:expectedResult atIndex:0];
}

- (nullable id)pop {
    id poppedItem = nil;
    // if we have no items, return nothing
    if (!self.itemsArray.count) {
        return poppedItem;
    }
    // else if we have at least 1 item, then get a strong reference
    // to the first item
    poppedItem = self.itemsArray.firstObject;
    // now remove that item from the array
    [self.itemsArray removeObjectAtIndex:0];
    // now return the removed object
    return poppedItem;
    
}

- (BOOL)isEmpty {
    return (self.itemsArray.count ? YES : NO);
}

- (NSUInteger)size {
    return self.itemsArray.count;
}

@end

@interface PNTThreadSafeStack ()
@property (nonatomic, strong, readwrite) dispatch_queue_t accessQueue;
@end

@implementation PNTThreadSafeStack

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

- (void)push:(id)expectedResult {
    PNTWeakify(self);
    dispatch_barrier_async(self.accessQueue, ^{
        PNTStrongify(self);
        [super push:expectedResult];
    });
}

- (nullable id)pop {
    __block id result = nil;
    PNTWeakify(self);
    dispatch_sync(self.accessQueue, ^{
        PNTStrongify(self);
        result = [super pop];
    });
    return result;
}

- (BOOL)isEmpty {
    __block BOOL empty = YES;
    PNTWeakify(self);
    dispatch_sync(self.accessQueue, ^{
        PNTStrongify(self);
        empty = [super isEmpty];
    });
    return empty;
}

- (NSUInteger)size {
    __block NSUInteger count = YES;
    PNTWeakify(self);
    dispatch_sync(self.accessQueue, ^{
        PNTStrongify(self);
        count = [super size];
    });
    return count;
}

@end
