//
//  PhoneNumber.h
//  Lab3
//
//  Created by paula on 2018-08-20.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhoneNumber : NSObject

@property NSString *label;
@property NSString *phoneNumber;

- (id)initWithLabel:(NSString *)aLabel
        phoneNumber:(NSString *)aPhoneNumber;

@end
