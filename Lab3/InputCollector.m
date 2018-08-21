//
//  InputCollector.m
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

- (id)initWithHistory{
    self = [super init];
    if(self){
        self.history = [NSMutableArray arrayWithObjects:@"",@"",@"",nil];
    }
    return self;
}

- (NSString *)inputForPrompt:(NSString *)promptString{
    char input[255];
    
    NSLog(@"%@", promptString);
    fgets(input, 255, stdin);
    
    NSString *command = [[[NSString stringWithUTF8String:input] lowercaseString] stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    [self addHistory:command];
    
    return command;
}

- (void)addHistory:(NSString *)command{
    [self.history replaceObjectAtIndex:0 withObject:[self.history objectAtIndex:1]];
    [self.history replaceObjectAtIndex:1 withObject:[self.history objectAtIndex:2]];
    [self.history replaceObjectAtIndex:2 withObject:command];
}

- (void)printHistory{
    NSMutableString *listing = [[NSMutableString alloc] init];
    [listing appendString:@"\n\nHistory:"];
    for(int index = 0; index < 3; index++){
        [listing appendFormat:@"\n%@", self.history[index]];
    }
    NSLog (@"%@\n\n\n", listing);
}

@end
