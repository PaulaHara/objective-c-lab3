//
//  InputCollector.m
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString{
    char input[255];
    
    NSLog(@"%@", promptString);
    fgets(input, 255, stdin);
    
    return [NSString stringWithUTF8String:input];
}

@end
