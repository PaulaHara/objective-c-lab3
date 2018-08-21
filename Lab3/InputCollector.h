//
//  InputCollector.h
//  Lab3
//
//  Created by paula on 2018-08-16.
//  Copyright © 2018 paula. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject

//@property NSArray *history;
@property NSMutableArray *history;

- (id)initWithHistory;

- (NSString *)inputForPrompt:(NSString *)promptString;

- (void)addHistory:(NSString *)command;

- (void)printHistory;

@end
