//
//  PNTTestRepresentation.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <Foundation/Foundation.h>

@class PubNub;
@class PNResult;

NS_ASSUME_NONNULL_BEGIN

@protocol PNTTestRepresentation <NSObject>

+ (Class)PubNubClass;
+ (NSString *)PubNubClassName;
+ (NSArray<NSString *> *)keysToAssert;
- (instancetype)initWithClient:(PubNub *)client;

@property (nonatomic, strong, readonly) PubNub *client;
@property (nonatomic, strong, nullable) PNResult *actualResult;

@optional
+ (NSArray<NSString *> *)dataKeysToAssert;
+ (NSArray<NSString *> *)assertionsWithoutOrdering; // this is used to override `keysToAssert` and `dataKeysToAssert` matching to use sets and unordered matching for arrays instead of default ordered matching
- (BOOL)isError;

@end

NS_ASSUME_NONNULL_END
