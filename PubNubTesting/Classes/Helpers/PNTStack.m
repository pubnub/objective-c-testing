//
//  PNTStack.m
//  Pods
//
//  Created by Jordan Zucker on 7/19/16.
//
//

#import "PNTStack.h"

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
