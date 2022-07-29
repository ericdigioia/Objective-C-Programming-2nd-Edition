//
//  BNRAppliance.m
//  Appliances
//
//  Created by Eric Di Gioia on 7/29/22.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)init {
    return [self initWithProductName:@"Unknown"];
}

- (instancetype)initWithProductName:(NSString *)pn {
    if (self = [super init]) {
        _productName = [pn copy];
        _voltage = 120;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", self.productName, self.voltage];
}

@end
