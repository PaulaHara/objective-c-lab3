//
//  Contact.m
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import "Contact.h"

@implementation Contact

- (id)initContactWithName:(NSString *)aName
                    email:(NSString *)aEmail{
    self = [super init];
    if(self){
        self.name = aName;
        self.email = aEmail;
    }
    return self;
}

@end
