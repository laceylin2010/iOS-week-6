//
//  main.m
//  Week6Day1
//
//  Created by Lacey Vu on 3/7/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Additions.h"
#import "Task.h"


int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSArray *randomArray = @[@"Pencil", @10, @4, @"Marker"];
        
        NSString *colors = @"My favorite color is blue";
        NSArray *newArray = [colors arrayOfWords];
        NSLog(@"%@", newArray);
        [Task checkingType: [NSNumber numberWithInt:10]];
        [Task checkingType:[NSString stringWithFormat:@"yellow"]];
        [Task checkingType:[[NSArray alloc]initWithArray:randomArray]];
    }
    return 0;
}



