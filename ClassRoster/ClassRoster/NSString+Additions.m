//
//  NSString+Additions.m
//  ClassRoster
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)

-(BOOL)isValidEmailAddress
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"]evaluateWithObject:self];
}


@end
