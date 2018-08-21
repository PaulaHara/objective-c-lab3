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
void addNewContact(InputCollector *inputCollector, ContactList *contactList);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *option = @"";
        InputCollector *inputCommand = [[InputCollector alloc] initWithHistory];
        InputCollector *inputCollector = [[InputCollector alloc] init];
        ContactList *contactList = [[ContactList alloc] initWithMutableArray];
        
        while(![option isEqualToString:@"quit"]){
            NSString *menu = @"\n\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nshow - Search contact by id and display\nfind <search term> - Search contacts that have the search term in their name or email\nhistory - Print the last 3 commands used\nquit - Exit application\n";
            option = [inputCommand inputForCommand:menu];
            
            if([option isEqualToString:@"new"]){
                addNewContact(inputCollector, contactList);
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
                if([[option componentsSeparatedByString:@" "] count] > 1){
                    NSString *searchTerm = [option componentsSeparatedByString:@" "][1];
                    [contactList searchByWord:searchTerm];
                }else{
                    [contactList printAllContacts];
                }
            }else if([option isEqualToString:@"history"]){
                [inputCommand printHistory];
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

void addNewContact(InputCollector *inputCollector, ContactList *contactList){
    NSString *email = [inputCollector inputForPrompt:@"\n\nEnter email:"];
    if([contactList emailAlreadyExist:email]){
        printf("Error: Duplicated email!\n");
    }else{
        NSString *name = [inputCollector inputForPrompt:@"\nEnter name:"];
        Contact *contact = [[Contact alloc] initContactWithName:name email:email];
        
        char addPhone;
        printf("\nDo you wanna add a phone number? (y/n)");
        scanf("%c", &addPhone);
        
        // If I use 'while' for some reason it gives the 'invalid option' msg
        //while(addPhone == 'y'){
           [inputCollector inputForPrompt:@""];
            NSString *label = [inputCollector inputForPrompt:@"\n\nEnter label:"];
            NSString *number = [inputCollector inputForPrompt:@"\nEnter phone number:"];
            
            PhoneNumber *phoneNumber = [[PhoneNumber alloc] initWithLabel:label phoneNumber:number];
            [contact addNumber:phoneNumber];
            
            //printf("\nDo you wanna add another phone number? (y/n)");
            //scanf("%c", &addPhone);
        //}
        
        [contactList addContact:contact];
        printf("Contact added succesfully!\n");
    }
}
