//
//  main.m
//  Week6Day1
//
//  Created by Lacey Vu on 3/7/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Additions.h"



int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSString *colors = @"My favorite color is blue";
        NSArray *newArray = [colors arrayOfWords];
        NSLog(@"%@", newArray);

    }
    return 0;
}



