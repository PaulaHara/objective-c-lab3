//
//  main.m
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int getNumberizeWord(NSString *word);
Boolean hasFind(NSString *option);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *option = @"";
        InputCollector *inputCollector = [[InputCollector alloc] init];
        ContactList *contactList = [[ContactList alloc] initWithMutableArray];
        
        while(![option isEqualToString:@"quit"]){
            NSString *menu = @"\n\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nshow - Search contact by id and display\nfind <search term> - Search contacts that have the search term in their name or email\nquit - Exit application\n";
            option = [inputCollector inputForPrompt:menu];
            
            if([option isEqualToString:@"new"]){
                NSString *name = [inputCollector inputForPrompt:@"\n\nEnter name:"];
                NSString *email = [inputCollector inputForPrompt:@"\nEnter email:"];
                
                Contact *contact = [[Contact alloc] initContactWithName:name email:email];
                [contactList addContact:contact];
                printf("Contact added succesfully!\n");
            }else if([option isEqualToString:@"list"]){
                [contactList printAllContacts];
            }else if([option isEqualToString:@"show"]){
                NSString *contactId = [inputCollector inputForPrompt:@"\n\nEnter the contact ID:\n"];
                int index = getNumberizeWord(contactId);
                if(index >= 0){
                    [contactList printContactById:index];
                }else{
                    printf("\nError: Invalid ID!\n");
                }
            }else if(hasFind(option)){
                NSString *searchTerm = [option componentsSeparatedByString:@" "][1];
                
            }else if([option isEqualToString:@"quit"]){
                printf("\n\nBye bye (^_^)/\n");
            }else{
                printf("\n\nInvalid option!\n");
            }
        }
    }
    return 0;
}

Boolean hasFind(NSString *option){
    NSString *firstWord = [option componentsSeparatedByString:@" "][0];
    if([firstWord isEqualToString:@"find"]){
        return true;
    }
    return false;
}

int getNumberizeWord(NSString *word){
    word = [word lowercaseString];
    if([word isEqualToString:@"0"]){
        return 0;
    }
    
    NSInteger number = [word integerValue];
    if(number == 0){
        return -1;
    }
    
    return (int) number;
}
