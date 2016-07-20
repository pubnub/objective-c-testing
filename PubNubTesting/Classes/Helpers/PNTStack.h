//
//  PNTStack.h
//  Pods
//
//  Created by Jordan Zucker on 7/19/16.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// TODO: check into the annotation http://drekka.ghost.io/objective-c-generics/
@interface PNTStack<ObjectType> : NSObject

+ (instancetype)stack;

- (void)push:(ObjectType)expectedResult;
- (nullable ObjectType)pop;

@property (nonatomic, assign, readonly) BOOL isEmpty;
@property (nonatomic, assign, readonly) NSUInteger size;

@end

NS_ASSUME_NONNULL_END
