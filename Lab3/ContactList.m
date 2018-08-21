//
//  ContactList.m
//  Lab3
//
//  Created by paula on 2018-08-17.
//  Copyright © 2018 paula. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (id)initWithMutableArray{
    self = [super init];
    if(self){
        Contact *contact1 = [[Contact alloc] initContactWithName:@"Test" email:@"test@email.com"];
        Contact *contact2 = [[Contact alloc] initContactWithName:@"Fulano" email:@"fulano@email.com"];
        Contact *contact3 = [[Contact alloc] initContactWithName:@"Ciclano" email:@"ciclano@email.com"];
        
        self.contacts = [NSMutableArray arrayWithObjects:contact1, contact2, contact3, nil];
    }
    return self;
}

- (void)addContact:(Contact *)newContact{
    // Get the first letter and make it uppercase
    newContact.name = [NSString stringWithFormat:@"%@%@",[[newContact.name substringToIndex:1] capitalizedString],[newContact.name substringFromIndex:1]];
    [self.contacts addObject:newContact];
}

- (void)printAllContacts{
    NSMutableString *listing = [[NSMutableString alloc] init];
    [listing appendString:@"\n\nContact Index:"];
    for (int index = 0; index < [self.contacts count]; index++) {
        Contact *contact = [self.contacts objectAtIndex:index];
        [listing appendFormat:@"\n%d: %@ (%@)", index, contact.name, contact.email];
    }
    NSLog (@"%@\n\n\n", listing);
}

- (void)printContactById:(int)contactId{
    if(contactId >= [self.contacts count]){
        printf("Not Found!\n");
    }else{
        Contact *contact = [self.contacts objectAtIndex:contactId];
        [self printContact:contactId name:contact.name email:contact.email];
    }
}

- (void)searchByWord:(NSString *)searchTerm{
    Boolean foundSomething = false;
    
    for (int index = 0; index < [self.contacts count]; index++) {
        Contact *contact = [self.contacts objectAtIndex:index];
        if([contact.name containsString:searchTerm] || [contact.email containsString:searchTerm]){
            [self printContact:index name:contact.name email:contact.email];
            foundSomething = true;
        }
    }
    
    if(!foundSomething){
        printf("Not Found!\n");
    }
}

- (void)printContact:(int) index
                name:(NSString *) name
               email:(NSString *) email{
    NSLog(@"\n\nId - %d\nName - %@\nEmail - %@\n", index, name, email);
}

- (Boolean)emailAlreadyExist:(NSString *) email{
    for (int index = 0; index < [self.contacts count]; index++) {
        Contact *contact = [self.contacts objectAtIndex:index];
        
        if([contact.email isEqualToString:email]){
            return true;
        }
    }
    return false;
}

@end
