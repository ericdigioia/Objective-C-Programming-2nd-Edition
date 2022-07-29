//
//  BNROwnedAppliance.h
//  Appliances
//
//  Created by Eric Di Gioia on 7/29/22.
//

#import "BNRAppliance.h"

NS_ASSUME_NONNULL_BEGIN

@interface BNROwnedAppliance : BNRAppliance

@property (readonly) NSSet *ownerNames;

// the designated initializer
- (instancetype)initWithProductName:(NSString *)pn
                     firstOwnerName:(NSString *)n;

- (void)addOwnerName:(NSString *)n;
- (void)removeOwnerName:(NSString *)n;

@end

NS_ASSUME_NONNULL_END

