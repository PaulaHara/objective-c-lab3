//
//  ContactList.h
//  Lab3
//
//  Created by paula on 2018-08-17.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contacts;

- (id)initWithMutableArray;

- (void)addContact:(Contact *)newContact;

- (void)printAllContacts;

- (void)printContactById:(int)contactId;

- (void)searchByWord:(NSString *)searchTerm;

- (void)printContact:(int) index
                name:(NSString *) name
               email:(NSString *) email;

- (Boolean)emailAlreadyExist:(NSString *) email;

@end
