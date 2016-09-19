//
//  PNDeviceIndependentMatcher.m
//  PubNub Tests
//
//  Created by Jordan Zucker on 10/30/15.
//
//

#import "PNTDeviceIndependentMatcher.h"

typedef NSArray<NSURLQueryItem *> PNTQueryItemArray;

@implementation PNTDeviceIndependentMatcher

- (NSDictionary *)requestComparisonOptions {
    NSMutableDictionary *superComparisonOptions = [super requestComparisonOptions].mutableCopy;
    // ignored query items won't be passed to the override method
    superComparisonOptions[kBKRIgnoreQueryItemNamesOptionsKey] = @[
                                                         @"pnsdk",
                                                         @"seqn",
                                                         ];
    superComparisonOptions[kBKROverrideNSURLComponentsPropertiesOptionsKey] = @[@"path", @"queryItems"];
    return superComparisonOptions.copy;
}

- (BOOL)hasOverrideMatchForURLComponent:(NSString *)URLComponent withRequestComponentValue:(id)requestComponentValue possibleMatchComponentValue:(id)possibleMatchComponentValue {
    if ([URLComponent isEqualToString:@"path"]) {
        if (!requestComponentValue && !possibleMatchComponentValue) {
            return YES;
        }
        if (
            (!requestComponentValue && possibleMatchComponentValue) ||
            (requestComponentValue && !possibleMatchComponentValue)
            ) {
            return NO;
        }
        if (
            ![requestComponentValue isKindOfClass:[NSString class]] ||
            ![possibleMatchComponentValue isKindOfClass:[NSString class]]
            ) {
            NSLog(@"How can a path not be a string?");
            return NO;
        }
        NSString *requestPath = (NSString *)requestComponentValue;
        NSString *possibleMatchPath = (NSString *)possibleMatchComponentValue;
        
        if (
            [requestPath.lastPathComponent hasPrefix:@"{"] &&
            [possibleMatchPath.lastPathComponent hasPrefix:@"{"]
            ) {
            
            // first compare rest of path
            NSString *restOfPath = [requestPath stringByDeletingLastPathComponent];
            NSString *otherRestOfPath = [possibleMatchPath stringByDeletingLastPathComponent];
            if (![restOfPath isEqualToString:otherRestOfPath]) {
                return NO;
            }
            
            // Now convert publish to JSON and compare objects
            NSData *data = [requestPath.lastPathComponent dataUsingEncoding:NSUTF8StringEncoding];
            NSData *possibleMatchData = [requestPath.lastPathComponent dataUsingEncoding:NSUTF8StringEncoding];
            id message = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            id possibleMatchMessage = [NSJSONSerialization JSONObjectWithData:possibleMatchData options:kNilOptions error:nil];
            if (![message isEqual:possibleMatchMessage]) {
                return NO;
            }
            return YES;
        } else {
            return [requestPath isEqualToString:possibleMatchPath];
        }
    } else if ([URLComponent isEqualToString:@"queryItems"]) {
        PNTQueryItemArray *requestQueryItems = (PNTQueryItemArray *)requestComponentValue;
        PNTQueryItemArray *otherRequestQueryItems = (PNTQueryItemArray *)possibleMatchComponentValue;
        // need to separate into two arrays, one with query items that need to be turned into objects and one for everything else
//TODO: Fix this!
        // should only do this if state is being set, not if state is 1 or 0 (like in presence where now)
        // this is very inefficient
        NSString *stateQueryItemName = @"state";
        NSMutableArray<NSString *> *specialQueryItemsNames = [@[
                                                                stateQueryItemName,
                                                                ] mutableCopy];
        
        // pull out all simple matching query items
        NSPredicate *removeSpecialQueryItemNamesPredicate = [NSPredicate predicateWithFormat:@"NOT (name IN %@)", specialQueryItemsNames];
        PNTQueryItemArray *simpleRequestQueryItems = [requestQueryItems filteredArrayUsingPredicate:removeSpecialQueryItemNamesPredicate];
        PNTQueryItemArray *simpleOtherRequestQueryItems = [otherRequestQueryItems filteredArrayUsingPredicate:removeSpecialQueryItemNamesPredicate];
        
        // brittle solution, but remove state as a special matching item if it is length 1 (that means
        // it is most likely a boolean value of 0 or 1 for whether to include state in other calls)
        // better long term solution would be only do special matching for state for paths that require it
        // because we are not doing it correctly, the special value is pulled out then put back in
        
        BOOL simpleMatch = [NSURLComponents BKR_componentQueryItems:simpleRequestQueryItems matchesOtherComponentQueryItems:simpleOtherRequestQueryItems withOptions:[self requestComparisonOptions]];
        
        // pull out all special query items
        NSPredicate *removeNonSpecialQueryItemNamesPredicate = [NSPredicate predicateWithFormat:@"(name IN %@)", specialQueryItemsNames];
        PNTQueryItemArray *objectRequestQueryItems = [requestQueryItems filteredArrayUsingPredicate:removeNonSpecialQueryItemNamesPredicate];
        PNTQueryItemArray *objectOtherRequestQueryItems = [otherRequestQueryItems filteredArrayUsingPredicate:removeNonSpecialQueryItemNamesPredicate];
        
        BOOL objectMatch = YES;
        for (NSInteger i=0; i<objectRequestQueryItems.count; i++) {
            NSURLQueryItem *queryItem = objectRequestQueryItems[i];
            NSURLQueryItem *otherQueryItem = objectOtherRequestQueryItems[i];
            // here we will do simple compares if the value is length 1
            if (
                (queryItem.value.length ==1) &&
                (otherQueryItem.value.length == 1) &&
                ([queryItem.name isEqualToString:stateQueryItemName]) &&
                ([otherQueryItem.name isEqualToString:stateQueryItemName])
                ) {
                if (![NSURLComponents BKR_componentQueryItems:@[queryItem] matchesOtherComponentQueryItems:@[otherQueryItem] withOptions:[self requestComparisonOptions]]) {
                    objectMatch = NO;
                    break;
                }
                continue;
            }
            // Now convert publish to JSON and compare objects
            NSData *data = [queryItem.value dataUsingEncoding:NSUTF8StringEncoding];
            NSData *possibleMatchData = [otherQueryItem.value dataUsingEncoding:NSUTF8StringEncoding];
            id object = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            id otherObject = [NSJSONSerialization JSONObjectWithData:possibleMatchData options:kNilOptions error:nil];
            if (![object isEqual:otherObject]) {
                objectMatch = NO;
                break;
            }
        }
        
        return (
                simpleMatch &&
                objectMatch
                );
        
    }
    return YES;
}

@end
