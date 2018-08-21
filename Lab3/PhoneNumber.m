//
//  PhoneNumber.m
//  Lab3
//
//  Created by paula on 2018-08-20.
//  Copyright © 2018 paula. All rights reserved.
//

#import "PhoneNumber.h"

@implementation PhoneNumber

- (id)initWithLabel:(NSString *)aLabel
          phoneNumber:(NSString *)aPhoneNumber{
    self = [super init];
    if(self){
        self.label = aLabel;
        self.phoneNumber = aPhoneNumber;
    }
    return self;
}

@end
