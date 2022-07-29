//
//  BNROwnedAppliance.m
//  Appliances
//
//  Created by Eric Di Gioia on 7/29/22.
//

#import "BNROwnedAppliance.h"

@interface BNROwnedAppliance ()
{
    NSMutableSet *_ownerNames;
}
@end

@implementation BNROwnedAppliance

- (instancetype)initWithProductName:(NSString *)pn firstOwnerName:(NSString *)n {
    if (self = [super initWithProductName:pn]) {
        _ownerNames = [[NSMutableSet alloc] init];
        
        if (n) {
            [_ownerNames addObject:n];
        }
    }
    return self;
}

- (instancetype)initWithProductName:(NSString *)pn {
    return [self initWithProductName:pn firstOwnerName:nil];
}

- (void)addOwnerName:(NSString *)n {
    [_ownerNames addObject:n];
}

- (void)removeOwnerName:(NSString *)n {
    [_ownerNames removeObject:n];
}

- (NSSet *)ownerNames {
    // return an immutable copy of our set
    return [_ownerNames copy];
}

@end
