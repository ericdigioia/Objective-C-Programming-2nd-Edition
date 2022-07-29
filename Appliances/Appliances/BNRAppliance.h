//
//  BNRAppliance.h
//  Appliances
//
//  Created by Eric Di Gioia on 7/29/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BNRAppliance : NSObject

@property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// the designated initializer
- (instancetype)initWithProductName:(NSString *)pn;

@end

NS_ASSUME_NONNULL_END
