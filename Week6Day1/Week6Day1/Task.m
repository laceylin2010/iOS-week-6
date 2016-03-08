//
//  Task.m
//  Week6Day1
//
//  Created by Lacey Vu on 3/7/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "Task.h"

@implementation Task

+(void) checkingType: (id) isChecking;
{
    if ([isChecking isKindOfClass:[NSNumber class]])
    {
        float randomNumber = sqrt([isChecking floatValue]);
        NSLog(@"%f", randomNumber);
        
    } else if ([isChecking isKindOfClass:[NSString class]])
    {
    
        NSMutableString *reversedWord = [[NSMutableString alloc]init];
        
        for (int i = 0; i<[isChecking length]; i++) {
            unichar newChar = [isChecking characterAtIndex:(i)];
            NSString *newStringChar = [NSString stringWithFormat:@"%C", newChar];
            [reversedWord insertString:newStringChar atIndex:0];
        }
        NSLog(@"%@", reversedWord);
            
    } else if ([isChecking isKindOfClass:[NSArray class]])
    {
        int stringsInArray = 0;
        int numbersInArray = 0;
        for (id type in isChecking)
        {
            if ([type isKindOfClass:[NSString class]]) {
                stringsInArray ++;
            } else if ([type isKindOfClass: [NSNumber class]]){
                numbersInArray ++;
            }
        }
        
        NSLog(@"Strings: %d Numbers: %d", stringsInArray, numbersInArray);
        
    }
    
    
}


@end
