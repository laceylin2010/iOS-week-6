//
//  NSString+Additions.m
//  Week6Day1
//
//  Created by Lacey Vu on 3/7/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

- (NSArray *) arrayOfWords
{
    
    NSArray *randomArray = [self componentsSeparatedByString: @" "];
    return randomArray;
}



@end
