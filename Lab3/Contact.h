//
//  Contact.h
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneNumber.h"

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableArray *numbers;

- (id)initContactWithName:(NSString *)aName
                    email:(NSString *)aEmail;

- (void)addNumber:(PhoneNumber *)phoneNumber;

@end
