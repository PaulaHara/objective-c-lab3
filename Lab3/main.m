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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *option = @"";
        
        InputCollector *inputCollector = [[InputCollector alloc] init];
        
        while(![option isEqualToString:@"quit"]){
            NSString *menu = @"\nWhat would you like to do next?\nnew - Create a new contact\nlist - List all contacts\nquit - Exit application\n";
            
            option = [[[inputCollector inputForPrompt:menu] lowercaseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            
            if([option isEqualToString:@"new"]){
                NSString *askName = @"\nEnter name:\n";
                NSString *name = [[[inputCollector inputForPrompt:askName] lowercaseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                NSString *askEmail = @"\nEnter email:\n";
                NSString *email = [[[inputCollector inputForPrompt:askEmail] lowercaseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                
                Contact *contact = [[Contact alloc] initContactWithName:name email:email];
            }else if([option isEqualToString:@"list"]){
                printf("\n2\n");
            }else if([option isEqualToString:@"quit"]){
                printf("\nBye bye (^_^)/\n");
            }else{
                printf("\nInvalid option!\n");
            }
        }
    }
    return 0;
}
