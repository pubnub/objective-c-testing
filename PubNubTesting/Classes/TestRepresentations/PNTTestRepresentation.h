//
//  PNTTestRepresentation.h
//  Pods
//
//  Created by Jordan Zucker on 7/12/16.
//
//

#import <Foundation/Foundation.h>

@class PubNub;

@protocol PNTTestRepresentation <NSObject>

+ (Class)PubNubClass;
+ (NSString *)PubNubClassName;
- (NSArray<NSString *> *)keysToAssert;
- (instancetype)initWithClient:(PubNub *)client andPubNubResult:(id)actualPubNubResult;

@property (nonatomic, strong, readonly) PubNub *client;
@property (nonatomic, strong, readonly) NSObject *actualResult;

@optional
- (NSArray<NSString *> *)dataKeysToAssert;
- (BOOL)isError;

@end
