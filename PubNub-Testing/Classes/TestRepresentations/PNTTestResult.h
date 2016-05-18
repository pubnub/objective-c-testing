//
//  PNTTestResult.h
//  Pods
//
//  Created by Jordan Zucker on 5/17/16.
//
//

#import <XCTest/XCTest.h>
#import <PubNub/PubNub.h>

@protocol PNTTestRepresentation <NSObject>

//- (BOOL)PNT_assertsTrueWithPubNubObject:(PNResult *)result;
- (NSArray<NSString *> *)keysToAssert;
- (id)valueForKey:(NSString *)key;

@end

@interface PNTTestResult : NSObject <PNTTestRepresentation>

@property (nonatomic, readonly, assign) NSInteger statusCode;
@property (nonatomic, readonly, assign) PNOperationType operation;
@property (nonatomic, readonly, strong) PubNub *client;

- (instancetype)initWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType;

+ (instancetype)resultWithClient:(PubNub *)client statusCode:(NSInteger)statusCode operation:(PNOperationType)operationType;

+ (NSString *)PubNubClassName;

+ (Class)PubNubClass;

@end
